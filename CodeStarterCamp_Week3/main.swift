//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var money: Int
    
    mutating func buyCoffee(_ price:Int) {
        money = money-price
    }
}

var person = Person.init(money: 5000)
person.buyCoffee(3000)
print("남은돈:",person.money)

class CoffeeShop {
    var take: Int = 10000000
    var coffeeType: String = ""
    var price: Int = 0
    var pickUpTable: Array<String> = []
    
    // 주문받기
    func takeOrder(_ coffeeType: String, _ price: Int) {
        self.coffeeType = coffeeType
        self.price = price
        self.take = self.take + price
    }
    // 커피만들기
    func makeCoffee(_ coffeeType:String) {
        pickUpTable.append(coffeeType)
    }
}

struct Store {
    var barista: Person
}

enum Coffee {
    case americano, cappuccino, espresso
}

var misterLee: Person = Person.init(money: 60000)
var misterKim: Person = Person.init(money: 50000)
var yagombucks: Store = Store.init(barista: misterLee)


