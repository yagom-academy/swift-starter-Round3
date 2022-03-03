//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    let age: Int
    var money: Int
    
    init(name: String, age: Int, money: Int){
        self.name = name
        self.age = age
        self.money = money
    }
    
    mutating func buySomething(price: Int) {
        print("\(price)원의 물건을 구매합니다.")
        money -= price
        print("\(money)가 남았습니다.")
    }
}

struct CoffeeShop {
    var sales: Int
    var barista: Person
    var menu: [Coffee]
    var pickUpTable: String?
    
    init(sales: Int, barista: Person, menu: [Coffee]) {
        self.sales = sales
        self.barista = barista
        self.menu = menu
    }
    
    mutating func takeOrder(coffee: Coffee) {
        print("주문하신 \(coffee)의 가격은 \(coffee.rawValue)입니다.")
        sales += coffee.rawValue
        bringOutCoffee(coffee: coffee)
    }
    
    mutating func bringOutCoffee(coffee: Coffee) {
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
