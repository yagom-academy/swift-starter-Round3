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
    private var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    init(name: String) {
        self.name = name
        money = 100
    }
    
    func buy(coffee: Menu) {
        let moneyLeft = self.money - coffee.price
        print("이제 \(moneyLeft) 밖에 없습니다.")
    }
}

struct CoffeeShop {
    var profit: Int
    var list: Menu
    var pickUpTable: [Coffee]
    var barista: Person
    
    init(profit: Int, list: Menu, pickUpTable: [Coffee], barista: Person) {
        self.profit = profit
        self.list = list
        self.pickUpTable = pickUpTable
        self.barista = barista
    }
    
    func takeOrder(of menu: Menu) {
        let order = menu.coffeeType
        let orderReceipt = menu.price
        print("주문 확인하겠습니다. \(order) 한 잔은 \(orderReceipt)달러 입니다.")
    }
    
    mutating func brewCoffee(of menu: Menu) {
        let drink = menu.coffeeType
        print("주문하신 \(drink)가 준비 되었습니다.")
        pickUpTable.append(drink)
    }
}

struct Menu {
    var coffeeType: Coffee
    var price: Int
}

enum Coffee: Int {
    case espresso = 10
    case americano = 20
    case latte = 30
    case handDrip = 50
}

let misterLee = Person(name: "미스터리")
let missKim = Person(name: "미스 김")

let yagombuck: CoffeeShop = CoffeeShop(profit: 0,
                                       list: Menu(coffeeType: Coffee.espresso, price: Coffee.espresso.rawValue),
                                       pickUpTable: [],
                                       barista: misterLee)

