//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by suyeon park on 2023/03/09.
//

import Foundation

class Person {
    var totalMoney: Int
    
    func buyCoffee(spendMoney: Int) -> Bool {
        if totalMoney >= spendMoney {
            calculateMoney(spendMoney: spendMoney)
            return true
        } else {
            return false
        }
    }
    
    private func calculateMoney(spendMoney: Int) {
        totalMoney = totalMoney - spendMoney
        print("커피가 계산 되었습니다. 총 잔액은 \(totalMoney)원 입니다.")
    }
    
    init (totalMoney: Int) {
        self.totalMoney = totalMoney
    }
}
