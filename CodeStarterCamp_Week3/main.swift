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
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    func toBuy(coffee: coffee) {
        
    }
}

class CoffeeShop  {
    var sales: Int = 0
    var coffee: coffee
    var price: Int
    var barista: Person
    
    init(coffee: coffee, price: Int, barista: Person) {
        self.coffee = coffee
        self.price = price
        self.barista = barista
    }
    
    func orderCoffee() {
        print("\(coffee) 주문 받았습니다.")
    }
    
    func pickupTable() {
        print("주문하신 \(coffee) 나왔습니다.")
    }
}

enum coffee: String {
    case latte = "라떼"
    case americano = "아메리카노"
}

var misterLee: Person = Person(name: "misterLee", money: 10000)
var missKim: Person = Person(name: "missKim", money: 10000)
var yagombucks:coffeeShop = coffeeShop(coffee: coffee.americano, price: 5000, barista: misterLee)
