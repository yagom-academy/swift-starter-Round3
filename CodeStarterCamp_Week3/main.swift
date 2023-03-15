//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var age: Int
    var money: Int
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        let coffeeShop = coffeeShop
        let coffeeName: String = coffee.rawValue
        
        if let price: Int = coffeeShop.menu[coffeeName] {
            if price > money {
                let needMoney = price - money
                print("잔액이 \(needMoney)원만큼 부족합니다.")
                
            } else {
                money -= price
                coffeeShop.make(coffee, for: name)
            }
        }
    }
}

class CoffeeShop {
    var dailySalesFigures: Int = 0
    var barista: Person
    var menu: [String: Int] = ["아메리카노": 3200, "콜드브루": 3900, "카페라떼": 4200,
                               "카푸치노": 4200, "카페모카": 4500, "카라멜마끼아또": 4500,
                               "토피넛라떼": 4200, "복숭아아이스티": 2900]
    var guestName: String = ""
    var pickUpTable: [Coffee] = [] {
        didSet {
            let message = "\(guestName)님이 주문하신 \(pickUpTable.removeFirst().rawValue)가 준비되었습니다."
                          + " " + "픽업대에서 가져가주세요."
            print(message)
        }
    }
    
    init(barista: Person) {
        self.barista = barista
    }
    
    func make(_ coffee: Coffee, for name: String) {
        if let price: Int = menu[coffee.rawValue] {
            dailySalesFigures += price
        }
        self.guestName = name
        pickUpTable.append(coffee)
    }
}

enum Coffee: String {
    case americano = "아메리카노", coldBrew = "콜드브루"
    case cafeLatte = "카페라떼", cappuccino = "카푸치노", cafeMocha = "카페모카", caramelMacchiato = "카라멜마끼아또"
    case toffeeNutLatte = "토피넛라떼", peachIcedTea = "복숭아아이스티"
}

var misterLee: Person = Person(name: "misterLee", age: 35, money: 20000)
var missKim: Person = Person(name: "missKim", age: 30, money: 10000)
var yagombucks: CoffeeShop = CoffeeShop(barista: misterLee)

missKim.order(Coffee.americano, of: yagombucks, by: missKim.name)
missKim.order(Coffee.toffeeNutLatte, of: yagombucks, by: missKim.name)
missKim.order(Coffee.peachIcedTea, of: yagombucks, by: missKim.name)
print("yagombucks의 매출액은 \(yagombucks.dailySalesFigures)원 입니다.")
print("missKim의 잔액은 \(missKim.money)원 입니다.")
