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
    var money: Int
    var job: String?
    var house: String?
    
    init(money: Int) {
        self.money = money
    }
    
    func buyCoffee(paying: Int) {
        print("지불할 돈은 \(paying)입니다")
        self.money -= paying
        print("남은 돈은 \(self.money)입니다")
    }
}

class CoffeeShop {
    var barista: Person
    var profit: Int = 0
    var menu: [Coffee: Int] = [.iceAmericano: 1800, .hotAmericano: 1500, .iceCafeMocha: 3000, .hotCafeMocha: 2800,
                               .iceLatte: 2600, .hotLatte: 2400]
    var pickUpTable: [Coffee] = []
    
    init(barista: Person, profit: Int) {
        self.barista = barista
        self.profit = profit
    }
    
    func takeOrder(person: Person, coffees: [Coffee]) {
        var payMoney: Int = 0
        
        print("주문을 받습니다.")
        for coffee in coffees {
            if let price = self.menu[coffee] {
                payMoney += price
                print("\(coffee.rawValue)를 주문했습니다 가격은 \(price)입니다.")
            }
        }
        
        person.buyCoffee(paying: payMoney)
        self.profit += payMoney
        makeCoffee(coffees: coffees)
    }
    
    func makeCoffee(coffees: [Coffee]) {
        self.pickUpTable = coffees
        print("커피 나왔습니다~")
    }
}

let misterLee = Person(money: 50000)
let missKim = Person(money: 1000000)

let yagombucks = CoffeeShop(barista: misterLee, profit: 0)

yagombucks.takeOrder(person: missKim, coffees: [.iceAmericano, .iceAmericano, .iceCafeMocha])
print("남은 돈은 \(missKim.money)입니다")
