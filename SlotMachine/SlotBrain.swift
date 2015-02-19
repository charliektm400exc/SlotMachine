//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by Charlie Franklin on 7/02/2015.
//  Copyright (c) 2015 Charlie Franklin. All rights reserved.
//

import Foundation


class SlotBrain {
   class func unpackSlotsIntoSlotRows (slots: [[Slot]]) -> [[Slot]] {
    
        var slotRow: [Slot] = []
        var slotRow2: [Slot] = []
        var slotRow3: [Slot] = []
        
        for slotArray in slots {
            for var index = 0; index < slotArray.count; index++ {
                let slot = slotArray[index]
                if index == 0 {
                    slotRow.append(slot)
                }
                else if index == 1 {
                    slotRow2.append(slot)
                }
                else if index == 2 {
                    slotRow3.append(slot)
                }
                else {
                    println("Error Invalid Slot")
                }
                }
        }
        var slotsInRows: [[Slot]] = [slotRow, slotRow2, slotRow3]
        
        return slotsInRows
    }
    
    class func computeWinnings (slots: [[Slot]]) -> Int {
        
        var slotsInRows = unpackSlotsIntoSlotRows(slots)
        var winnings = 0
        
        var flushWinCount = 0
        var threeOfAKindWinCount = 0
        var straightWinCount = 0
        
        for slotRow in slotsInRows {
            
            if checkFlush(slotRow) == true {
                println("Fluch")
                winnings += 1
                flushWinCount += 1
            }
            
            if checkThreeInARow(slotRow) == true {
                println("three in a row")
                winnings += 1
                straightWinCount += 1
            }
            
            if checkThreeOfAKind(slotRow) == true {
                println("three in a row")
                winnings += 3
                threeOfAKindWinCount += 1
            }
        }

        
        if flushWinCount == 3 {
            println("Royal Flush")
            winnings += 15
            }
        
        if straightWinCount == 3 {
            println("Epic Straight")
            winnings += 1000
            }
            
            if threeOfAKindWinCount == 3 {
                println("Threes all around")
                winnings += 50
            }
        
        return winnings
    }
    
    class func checkFlush (slotRow: [Slot]) -> Bool {
        
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.isRed == true && slot2.isRed == true && slot3.isRed == true {
            return true
        }
        if slot1.isRed == false && slot2.isRed == false && slot3.isRed == false {
            return true
        }
        else {
            return false
        }
    }
    
    class func checkThreeInARow (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value - 1 && slot1.value == slot3.value - 2 {
            return true
    }
        else if slot1.value == slot2.value + 1 && slot1.value == slot3.value + 2 {
            return true
        }
        else {
            return false
        }
    }
    
    class func checkThreeOfAKind (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value && slot1.value == slot3.value {
            return true
        }
        else {
            return false
        }
    }
    
    
}