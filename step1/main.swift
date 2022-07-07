//
//  main.swift
//  step1
//
//  Created by codenest on 2022/07/06.
//

import Foundation

class Person {
    var name: String
    var age: Int
    var money: Int
    func order(_ coffee: Coffee) -> Coffee {
        return coffee
    }
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
}

class CoffeeShop {
    
}

enum Coffee: String {
    case americano = "아메리카노"
    case caffeeLatte = "카페라떼"
    case cappuccino = "카푸치노"
    case decaf = "디카페인"
    case einspanner = "아인슈패너"
    case caramelMacchiato = "카라멜 마끼아또"
}
