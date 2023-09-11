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
    
    init(name: String, gender: Gender, age: Int, money: Int) {
        self.name = name
        self.gender = gender
        self.age = age
        self.money = money
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
