//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by Lee minyeol on 2023/06/12.
//

import Foundation

struct Person {
    var name: String
    var money: Int
    
    mutating func buyCoffee (coffee: Coffee) {
        print("\(coffee.rawValue) 구매할게요")
    }
    
    mutating  func orderMoney(coffee: Coffee, coffeeshop: CoffeeShop) {
        if let coffePrice = coffeeshop.menuboard[coffee] {
            if money <= coffePrice {
                print("돈이 부족합니다.")
                return
            }
            money -= coffePrice
            print("결제 완료됐습니다.")
        }
    }
}

var misterLee: Person = Person(name: "misterLee", money: 5000)
var missKim: Person = Person(name: "missKim", money: 6000)
