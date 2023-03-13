//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var name: String
    var age: Int
    var money: Int
    
    mutating func orderCoffee(coffeeShop: CoffeeShop, _coffee: Coffee) {
        let coffee: String = _coffee.rawValue
        print("\(coffee) 한 잔 주세요.")
        
        if let price: Int = coffeeShop.menu[coffee] {
            money -= price
        }
    }
}

struct CoffeeShop {
    var dailySalesFigures: Int = 0
    var barista: Person
    var menu: [String: Int] = ["아메리카노": 3200, "콜드브루": 3900, "카페라떼": 4200, "카푸치노": 4200, "카페모카": 4500, "카라멜마끼아또": 4500, "토피넛라떼": 4200, "복숭아아이스티": 2900]
    var pickUpTable: [String] = []
    
    mutating func orderCoffee(_coffee: Coffee) {
        let coffee: String = _coffee.rawValue
        
        if let price: Int = menu[coffee] {
            print("\(coffee)는 \(price)원 입니다.")
            dailySalesFigures += price
        }
        pickUpTable.append(coffee)
    }
}

enum Coffee: String {
    case americano = "아메리카노", coldBrew = "콜드브루"
    case cafeLatte = "카페라떼", cappuccino = "카푸치노", cafeMocha = "카페모카", caramelMacchiato = "카라멜마끼아또"
    case toffeeNutLatte = "토피넛라떼", peachIcedTea = "복숭아아이스티"
}

let misterLee: Person = Person(name: "Lee", age: 35, money: 20000)
let missKim: Person = Person(name: "Kim", age: 30, money: 30000)
let yagombucks: CoffeeShop = CoffeeShop(barista: misterLee)
