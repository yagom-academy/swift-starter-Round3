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
    var nickname: String!
    var order: Coffee!

    init(name: String, gender: Gender, age: Int, money: Int) {
        self.name = name
        self.gender = gender
        self.age = age
        self.money = money
    }
    
    func buyCoffee(to: CoffeeShop, order: Coffee, nickname: String) {
        print("카페 \(to.name)에 \(nickname) 고객님이 \(order)(을)를 주문했습니다.\n")
        
        self.money -= order.price
        self.order = order
        self.nickname = nickname        
    }
    
    func eatCoffee(coffee: Coffee) {
        if coffee == self.order {
            print("주문한 \(coffee)(을)를 마셨습니다.\n")
        } else {
            print("\(coffee)(을)를 주문하지 않았습니다. 주문 먼저 해주세요.\n")
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
}
