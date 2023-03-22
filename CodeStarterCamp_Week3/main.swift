//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var money: Int = 0
    
    func order(_ coffee: Coffee, of coffeeshop: CoffeeShop, by name: String) {
        coffeeshop.make(coffee, for: name)
        if let coffeePrice: Int = coffeeshop.menuTable["\(coffee.rawValue)"] {
            if money >= coffeePrice {
                money -= coffeePrice
            } else {
                print("잔액이 \(coffeePrice-money)만큼 부족합니다.")
            }
            coffeeshop.sales += coffeePrice
        }
    }
}

class CoffeeShop {
    var sales: Int = 0
    var menuTable: [String: Int] = [
        "아메리카노": 4500,
        "라떼" : 4500,
        "에스프레소" : 4000,
        "카푸치노" : 4500
    ]
    var pickUpTable: [String] = []
    var barista: Person?
    
    func make(_ coffee: Coffee, for name: String) {
        pickUpTable.append(coffee.rawValue)
        print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

enum Coffee: String {
    case americano = "아메리카노", latte = "라떼", espresso = "에스프레소", cappuccino = "카푸치노"
}

let misterLee: Person = Person()
let missKim: Person = Person()
let yagombucks: CoffeeShop = CoffeeShop()
yagombucks.barista = misterLee

missKim.order(.americano, of: yagombucks, by: "missKim")
