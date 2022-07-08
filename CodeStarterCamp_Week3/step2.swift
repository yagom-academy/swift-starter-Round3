//
//  step2.swift
//  CodeStarterCamp_Week3
//
//  Created by smfc on 8/7/2022.
//

import Foundation

enum Coffee: Int {
    case 에스프레소 = 3800
    case 아메리카노 = 4200
    case 라떼 = 4500
    case 카푸치노 = 5100
    case 카페모카 = 5600
    case 오늘의커피 = 4600
    case 허브티 = 3500
}

struct Person {
    var name: String
    var age: Int
    var height: Double?
    var moneyAmount: Int
    
    mutating func order(_ coffee: Coffee) {
        let drinkPrice = coffee.rawValue
        if moneyAmount >= drinkPrice {
            print("\(coffee)를 \(drinkPrice)원에 구입합니다, ", terminator: "")
            self.moneyAmount = moneyAmount - drinkPrice
            print("남은 돈: \(self.moneyAmount)원")
        }
        else {
            print("잔액이 \(drinkPrice - moneyAmount)원 만큼 부족합니다.")
        }
    }
}

var misterLee: Person = Person(name: "misterLee", age: 20, height: 176.8, moneyAmount: 3500)
var missKim: Person = Person(name: "missKim", age: 24, moneyAmount: 20000)
var coda: Person = Person(name: "Coda", age: 50, moneyAmount: 1000000)
