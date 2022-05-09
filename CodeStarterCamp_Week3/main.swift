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
    var gender: genderList
    enum genderList {
        case male
        case female
    }
    var money: Int
    
    mutating func placeOrder(with coffee: Coffee, to coffeeShop: CoffeeShop) {} // 커피를 주문 합니다.
    mutating func payMoney(with money: Int, to coffeeShop: CoffeeShop) {}  // 돈을 지불합니다.
    mutating func getCoffee(from coffeeShop: CoffeeShop, with coffee: Coffee) {} // 주문한 커피를 받습니다.
}

struct CoffeeShop {
    var shopName: String
    var employeeNumber: Int
    var revenue: Int?
    var barista: Person
    struct pickUpTable {
        var pickUpCoffee: String?
        var isExist: Bool?
    }
    var pickUpTable: Bool?
    var menu: Dictionary<String, Int> = ["americano" : 2000, "espresso" : 2500, "cafeLatte" : 3000, "cafeMoca" : 3500, "vanilaLatte" : 4000]
    
    mutating func takeOrder(from customer: Person, what coffee: Coffee, with money: Int) {} // 주문을 받습니다.
    mutating func makeCoffee(what coffee: Coffee) {} // 커피를 만듭니다.
    mutating func giveCoffee(to customer: Person, with coffee: Coffee) {} // 커피를 고객에게 전달합니다.
}

enum Coffee {
    case americano
    case espresso
    case cafeLatte
    case cafeMoca
    case vanilaLatte
}

var misterLee = Person(name: "misterLee", age: 20, gender: .male, money: 10000)
var missKim = Person(name: "missKim", age: 20, gender: .female, money: 15000)
var yagombucks = CoffeeShop(shopName: "yagombucks", employeeNumber: 5, barista: misterLee)


