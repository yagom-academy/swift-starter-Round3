//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by smfc on 6/7/2022.
//

import Foundation

struct Person {
    var name: String
    var age: Int
    var height: Double?
    var moneyAmount: Int

    init(name: String, age: Int, height: Double, moneyAmount: Int) {
        self.name = name
        self.age = age
        self.height = height
        self.moneyAmount = moneyAmount
    }
    init(name: String, age: Int, moneyAmount: Int) {
        self.name = name
        self.age = age
        self.moneyAmount = moneyAmount
    }
    
    mutating func buyCoffee(spend cost: Int) -> Int {
        if moneyAmount >= cost {
            print("커피를 \(cost)원에 구입합니다")
            self.moneyAmount = moneyAmount - cost
            return moneyAmount - cost
        }
        else {
            print("가진 돈이 커피값보다 적습니다! 가진 돈: \(moneyAmount)원")
            return moneyAmount
        }
    }
}
