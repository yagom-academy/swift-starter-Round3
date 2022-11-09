//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee: String {
    case iceAmericano = "아이스 아메리카노"
    case hotAmericano = "따뜻한 아메리카노"
    case iceCafeMocha = "아이스 카페모카"
    case hotCafeMocha = "따뜻한 카페모카"
    case iceLatte = "아이스 라떼"
    case hotLatte = "따뜻한 라떼"
}

class Person {
    var name: String
    var money: Int
    var job: String?
    var house: String?
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buyCoffee(paying: Int) -> Int {
        if self.money-paying < 0 {
            return paying-money
        } else {
            self.money -= paying
            return paying-money
        }
    }
}

class CoffeeShop {
    var barista: Person
    var profit: Int = 0
    var menu: [Coffee: Int] = [.iceAmericano: 1800, .hotAmericano: 1500, .iceCafeMocha: 3000, .hotCafeMocha: 2800,
                               .iceLatte: 2600, .hotLatte: 2400]
    var pickUpTable: Coffee?
    var customer: Person?
    
    init(barista: Person, profit: Int) {
        self.barista = barista
        self.profit = profit
    }
    
    func order(_ coffee: Coffee) {
        if let coffeePrice = menu[coffee], let orderedCustomer = customer {
            let lackMoney = orderedCustomer.buyCoffee(paying: coffeePrice)
            if lackMoney > 0 {
                print("잔액이 \(lackMoney)만큼 부족합니다")
            } else {
                self.make(coffee, from: orderedCustomer.name)
            }
        }
    }
    
    func make(_ coffee: Coffee, from name: String) {
        self.pickUpTable = coffee
        print("\(name)님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

let misterLee = Person(name: "misterLee", money: 50000)
let missKim = Person(name: "missKim", money: 100)

let yagombucks = CoffeeShop(barista: misterLee, profit: 0)

yagombucks.customer = missKim
yagombucks.order(.iceCafeMocha)
