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
    let gender: String
    var money: Int
    
    func placeOrder() {} // 커피를 주문 합니다.
    func payMoney() {}  // 돈을 지불합니다.
    func getCoffee() {} // 주문한 커피를 받습니다.
    
    init(name: String, age: Int, gender: String, money: Int) {
        self.name = name
        self.age = age
        self.gender = gender
        self.money = money
    }
}

class CoffeeShop {
    let shopName: String
    var employeeNumber: Int
    var revenue: Int
    var barista: Person
    var pickUpTable: Bool?
    
    func takeOrder() {} // 주문을 받습니다.
    func makeCoffee() {} // 커피를 만듭니다.
    func giveCoffee() {} // 커피를 고객에게 전달합니다.
    
    struct Menu {
        let coffeeKind: String
        let cost: Int
    }
    
    init(shopName: String, employeeNumber: Int, revenue: Int, barista: Person, pickUpTable: Bool) {
        self.shopName = shopName
        self.employeeNumber = employeeNumber
        self.revenue = revenue
        self.barista = barista
        self.pickUpTable = pickUpTable
    }
}

enum Coffee {
    case americano, espresso, cafeLatte, cafeMoca, vanilaLatte
}

var misterLee: Person = Person(name: "misterLee", age: 20, gender: "male", money: 10000)
var missKim: Person = Person(name: "missKim", age: 20, gender: "female", money: 15000)
var yagombucks: CoffeeShop = CoffeeShop(shopName: "yagombucks", employeeNumber: 5, revenue: 200000, barista: misterLee, pickUpTable: true)
