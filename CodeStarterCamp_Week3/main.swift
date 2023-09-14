//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee: String {
    case espresso
    case americano
    case latte
    case cappuccino
    
    var price: Int {
        switch self {
        case .espresso:
            return 3000
        case .americano:
            return 4000
        case .latte:
            return 4500
        case .cappuccino:
            return 4500
        }
    }
}

enum Gender: String {
    case male
    case female
    case unknown
}

class Person {
    var name: String
    var gender: Gender
    var age: Int
    var money: Int {
        didSet {
            print("* \(name)의 잔액: \(oldValue)원 -> \(money)원\n")
        }
    }
    var order: Coffee?

    init(name: String, gender: Gender, age: Int, money: Int) {
        self.name = name
        self.gender = gender
        self.age = age
        self.money = money
    }
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop) {
        guard money >= coffee.price else {
            print("잔액이 \(coffee.price - money)원 만큼 부족합니다.")
            return
        }
        
        print("카페 \(coffeeShop.name)에 \(name) 님이 \(coffee)(을/를) 주문했습니다.\n")
        
        money -= coffee.price
        order = coffee
        
        coffeeShop.make(coffee, from: coffeeShop.barista.name, to: name)
    }
    
    func eat(coffee: Coffee) {
        if coffee == order {
            print("주문한 \(coffee)(을/를) 마셨습니다.\n")
        } else {
            print("\(coffee)(을/를) 주문하지 않았습니다. 주문 먼저 해주세요.\n")
        }
    }
}

class CoffeeShop {
    var name: String
    var location: String
    var menu: [Coffee]
    var barista: Person
    var sales: Int {
        didSet {
            print("* \(name)의 매출: \(oldValue)원 -> \(sales)원\n")
        }
    }
    var pickUpTable: [(customer: String, coffee: Coffee)] {
        didSet {
            let order = pickUpTable.removeFirst()
            print("\(order.customer)님이 주문하신 \(order.coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.\n")
        }
    }

    init(name: String, location: String, sales: Int, menu: [Coffee], pickUpTable: [(customer: String, coffee: Coffee)], barista: Person) {
        self.name = name
        self.location = location
        self.sales = sales
        self.menu = menu
        self.pickUpTable = pickUpTable
        self.barista = barista
    }

    func make(_ coffee: Coffee, from name: String, to customer: String) {
        sales += coffee.price

        print("( \(name)가 \(coffee)(을/를) 추출합니다... )\n")
        
        pickUpTable.append((customer, coffee))
    }
}

let missKim = Person(name: "AmyKim", gender: .female, age: 40, money: 20000)
let misterLee = Person(name: "JohnLee", gender: .male, age: 30, money: 10000)

let yagombucks = CoffeeShop(name: "yagombucks", location: "Seoul", sales: 100000, menu: [.espresso, .americano, .latte, .cappuccino], pickUpTable: [], barista: misterLee)

missKim.order(.latte, of: yagombucks)
missKim.eat(coffee: .americano)
