//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee: Int {
    case americano = 4500
    case latte = 4900
    case javachipFrappuccino = 6300
    case caramelMacchiato = 5200
}

struct Person {
    var name: String
    var age: Int
    var money: Int
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    func buyCoffee() {
        print("\(name)은 \(age)살 이며 곰다방에서 \(money)원을 주고 커피를 구매했다")
    }
}

struct CoffeeShop {
    var coffeeShop: String = "aaaaaaaAmeriacano"
    var sales: Int
    var barista: Person
    var menu = [Coffee]()
    var pickUpTable = [Coffee]()
    
    init(coffeeShop: String, sales: Int, barista: Person, menu: [Coffee] = [Coffee](), pickUpTable: [Coffee] = [Coffee]()) {
        self.coffeeShop = coffeeShop
        self.sales = sales
        self.barista = barista
        self.menu = menu
        self.pickUpTable = pickUpTable
    }
    
    mutating func orderingCoffee(barista:Person, menu:Coffee, price:Coffee.RawValue) {
        print("\(barista)가 주문한 메뉴 \(menu)을 만들고 있습니다.")
        print("\(menu) 주문 받았습니다 가격은\(price)원 입니다.")
        pickUpTable.append(menu)
    }
}
var myPerson: Person = Person(name: "tom", age: 20, money: 4500)
var missKim = Person(name: "missKee", age: 20, money: 9700)
var misterLee = Person(name: "misterLee", age: 22, money: 9700)

var other = CoffeeShop(coffeeShop: "yagombucks", sales: 1000, barista: misterLee)
other.orderingCoffee(barista: misterLee, menu: .americano, price: Coffee.americano.rawValue)
