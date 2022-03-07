//
//  structForCaffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 정주호 on 07/03/2022.
//

import Foundation

class Person {
    var name: String
    var age: Int
    var money: Int

    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    func order(coffee: Coffee) {
        print("\(coffee)주세요")
    }
}

struct CoffeeShop {
    var totalRevenue: Int
    var menu: [Coffee: Int] = [.americano: 5000, .latte: 5500, .cappuccino: 5500]
    var barista: Person

    func takeOrder(coffee: Coffee) {
        print("\(coffee)주문 받았습니다.")
        }
    
    func pickUpTable(coffee: Coffee) {
        print("주문하신 \(coffee) 나왔습니다.")
    }
}

enum Coffee {
    case americano, latte, cappuccino
}
