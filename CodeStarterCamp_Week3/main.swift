//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    let name: String
    let age: Int
    var money: Int
    
    init(name: String, age: Int, money: Int){
        self.name = name
        self.age = age
        self.money = money
    }

    func orderCoffee(coffee: Coffee, coffeeShop: CoffeeShop) {
        if money < coffee.rawValue {
            print("잔액이 \(coffee.rawValue - money)만큼 부족합니다.")
        } else {
            coffeeShop.takeOrder(coffee: coffee)
            money -= coffee.rawValue
        }
    }
}

class CoffeeShop {
    var sales: Int
    var barista: Person
    var menu: [Coffee]
    var pickUpTable: String?
    
    init(sales: Int, barista: Person, menu: [Coffee]) {
        self.sales = sales
        self.barista = barista
        self.menu = menu
    }
    
    func takeOrder(coffee: Coffee) {
        print("주문하신 \(coffee)의 가격은 \(coffee.rawValue)입니다.")
        sales += coffee.rawValue
        bringOutCoffee(coffee: coffee)
    }
    
    func bringOutCoffee(coffee: Coffee) {
        pickUpTable = String("\(coffee)")
        print("\(coffee)나왔습니다.")
    }
}

enum Coffee: Int {
    case americano = 3500
    case latte = 4000
    case espresso = 3000
    case water = 1000
}

var misterLee = Person(name: "Lee", age: 20, money: 10000)
var missKim = Person(name: "Kim", age: 30, money: 20000)
var yagombucks = CoffeeShop(sales: 0, barista: misterLee, menu: [.americano, .latte, .espresso, .water])
