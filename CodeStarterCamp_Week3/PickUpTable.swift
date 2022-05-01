//
//  PickUpTable.swift
//  CodeStarterCamp_Week3
//
//  Created by 황지웅 on 2022/04/26.
//

import Foundation

struct PickUpTable {
    private var pickUpTable: [Coffee: [String]] = [:]
    
    func checkTable(coffee: Coffee) -> Bool {
        if pickUpTable[coffee, default: []].count == 0 {
            return true
        }
        return false
    }
    
    mutating func release(coffee: Coffee) {
        if checkTable(coffee: coffee) { return }
        guard let orderManName = pickUpTable[coffee]?.removeFirst() else {
            print("커피 주문자가 없습니다.")
            return
        }
        print("\(orderManName) 님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
    }
    
    mutating func insertOrder(name: String, coffee: Coffee) {
        pickUpTable[coffee, default: []].append(name)
    }
}
