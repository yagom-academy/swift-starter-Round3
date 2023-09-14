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
    var money: Int
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
        
        money -= coffee.price
        coffeeShop.sales += coffee.price
        
        order = coffee
        
        print("카페 \(coffeeShop.name)에 \(name) 님이 \(coffee)(을/를) 주문했습니다.\n")
        
        coffeeShop.make(coffee, from: name)
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
    var sales: Int
    var menu: [Coffee]
    var pickUpTable: [Coffee] = []
    var barista: Person?

    init(name: String, location: String, sales: Int, menu: [Coffee]) {
        self.name = name
        self.location = location
        self.sales = sales
        self.menu = menu
    }

    func make(_ coffee: Coffee, from name: String) {
        print("( \(coffee)(을/를) 추출합니다... )\n")
        
        pickUpTable.append(coffee)
        
        print("\(name) 님이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.\n")
    }
}

let missKim = Person(name: "AmyKim", gender: .female, age: 40, money: 20000)
let yagombucks = CoffeeShop(name: "yagombucks", location: "Seoul", sales: 100000, menu: [.espresso, .americano, .latte, .cappuccino])

missKim.order(.latte, of: yagombucks)
missKim.eat(coffee: .americano)
