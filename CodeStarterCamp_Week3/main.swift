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
        self.money -= order.price
        self.order = order
        self.nickname = nickname
        
        to.takeOrder(nickname: nickname, order: order)
        
        print("카페 \(to.name)에 \(nickname) 고객님이 \(order)(을)를 주문했습니다.\n")
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
    
    func takeOrder(nickname: String, order: Coffee) {
        print("카페 \(self.name)에서 \(nickname) 고객님의 \(order)(을)를 주문 받았습니다.\n")
        
        sales += order.price
        
        makeCoffee(to: nickname, coffee: order)
    }
    
    func makeCoffee(to: String, coffee: Coffee) {
        pickUpTable.append(coffee)
        
        print("닉네임 \(to)으로 주문하신 고객님의 \(coffee)(이)가 완성되었습니다.\n")
    }
}

let misterLee = Person(name: "JohnLee", gender: .male, age: 30, money: 10000)
let missKim = Person(name: "AmyKim", gender: .female, age: 40, money: 20000)
let yagombucks = CoffeeShop(name: "yagombucks", location: "Seoul", sales: 100000, menu: [.espresso, .americano, .latte, .cappuccino])

yagombucks.barista = misterLee
