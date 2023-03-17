//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var nationality: String
    var birthYear: Int
    var birthDate: Int
    var money: Int
    var age: Int {
        get {
            return 2023 - birthYear
        }
    }
    
    init(nationality: String, birthYear: Int, birthDate: Int, money: Int) {
        self.nationality = nationality
        self.birthYear = birthYear
        self.birthDate = birthDate
        self.money = money
    }
    
    mutating func orderCoffee(coffeeShop: CoffeeShop, for coffees: Coffee...) {
        for coffee in coffees {
            if let price = coffeeShop.menu[coffee] {
                if money >= price {
                    print("\(coffee)를 주문합니다.")
                    self.money = money - price
                    print("금액이 \(price)만큼 차감됩니다.\n남은 금액은 \(self.money)입니다.")
                } else {
                    print("가지고 있는 돈으로는 구매할 수 없습니다.\n현재 가지고 계신 금액은 \(self.money)입니다.")
                }
            }
        }
    }
}

class CoffeeShop {
    var name: String
    var menu: Dictionary<Coffee, Int>
    var sales: Int
    var barista: String?
    var pickUpTable: Array<Coffee> = []
    
    init(name: String, menu: Dictionary<Coffee, Int>, sales: Int) {
        self.name = name
        self.menu = menu
        self.sales = sales
    }
    
    convenience init(name: String, barista: String, menu: Dictionary<Coffee, Int>, sales: Int) {
        self.init(name: name, menu: menu, sales: sales)
        self.barista = barista
    }
    
    func takeOrder(_ coffees: Coffee...) {
        for coffee in coffees {
            if let price = menu[coffee] {
                self.sales += price
                makeCoffee(coffee)
            } else {
                print("\(coffee)는 메뉴에 없습니다.")
            }
        }
    }
    
    func makeCoffee(_ coffees: Coffee) {
        self.pickUpTable.append(coffees)
        print("주문하신 \(coffees) 나왔습니다.")
    }
}

enum Coffee: String {
    case americano = "americano"
    case honeyAmericano = "honeyAmericano"
    case cappuccino = "cappuccino"
    case cafeLatte = "cafeLatte"
    case caramelMacchiato = "caramelMacchiato"
    case vanillaLatte = "vanillaLatte"
}

var misterLee = Person(nationality: "Korea", birthYear: 1990, birthDate: 0509, money: 4000)
var missKim = Person(nationality: "Korea", birthYear: 1997, birthDate: 1111, money: 10000)
let yagombucks = CoffeeShop(name: "yagombucks", menu: [Coffee.americano : 2000, Coffee.honeyAmericano : 3000, Coffee.cappuccino: 4000, Coffee.cafeLatte: 4000], sales: 0)

yagombucks.barista = "misterLee"

misterLee.orderCoffee(coffeeShop: yagombucks, for: Coffee.americano)
yagombucks.takeOrder(Coffee.americano)
print(yagombucks.pickUpTable)
