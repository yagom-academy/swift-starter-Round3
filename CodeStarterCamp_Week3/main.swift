//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

enum Coffee {
    case espresso, americano, latte
}

class Person {
    var name: String
    var age: Int
    var money: Int
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    func introduceSelf(){
        print("저의 이름은 \(name)이고 나이는 \(age)입니다. 소지금은 \(money)입니다.")
    }
    
    func order(coffee: Coffee) {
        print("\(coffee)를 구매하였습니다.")
    }
}

class CoffeShop {
    var shopName: String
    var baristar: Person
    var revenue: Int
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee]
    
    init(shopName: String, baristar: Person, revenue: Int, pickUpTable: [Coffee]) {
        self.shopName = shopName
        self.baristar = baristar
        self.revenue = revenue
        self.menu = [.espresso: 4000, .americano: 4500, .latte: 5000]
        self.pickUpTable = pickUpTable
    }
    
    func make(coffee: Coffee) {
        print("\(baristar)가 \(coffee)를 제작 중입니다.")
        self.pickUpTable.append(coffee)
        print("\(coffee)가 제작되었습니다.")
    }
    
}

let misterLee: Person = Person(name: "Lee", age: 20, money: 10000)

let missKim: Person = Person(name: "Kim", age: 26, money: 30000)

var yagombucks: CoffeShop = CoffeShop(shopName: "yagombucks", baristar: misterLee, revenue: 0, pickUpTable: [])
