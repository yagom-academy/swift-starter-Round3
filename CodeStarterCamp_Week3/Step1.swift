//
//  Step1.swift
//  CodeStarterCamp_Week3
//
//  Created by 홍성준 on 2023/08/02.
//

import Foundation

class Person {
    var name: String
    var age: Int
    var mbti: String?
    init(name: String, age: Int, mbti: String? = nil) {
        self.name = name
        self.age = age
        self.mbti = mbti
    }
    
}

class CoffeeShop {
    var barista: Person?
    var sales: Int = 0
    var menus: Dictionary<Coffee, Int> = [Coffee.americano: 4000]
    var pickUpTable: Array<Coffee> = []
    
    func getOrder(menus: [Coffee]) {
        for menu in menus {
            self.makeCoffee(menu)
        }
    }
    
    func makeCoffee(_ menu: Coffee) {
        self.pickUpTable.append(menu)
        if let sale = menus[menu] {
            self.sales += sale
        }
    }
}

enum Coffee: String {
    case americano = "americano"
    case latte = "latte"
    case caramel = "caramel"
    case greenTea = "greenTea"
    case iceTea = "iceTea"
}
