//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by 임기웅 on 2022/07/08.
//

import Foundation

struct Person {
    var money: Int
    var gender: String
    var country: String
    
    func eatFood(food: String) {
        print("\(food)를 먹습니다.")
    }
    
    func purchaseCoffee(coffee: Coffee) {
        print("\(coffee)를 구입합니다.")
    }
}

struct CoffeeShop {
    var sales: Int
    var barista: Person
    var menu: [String:Int] = [:]
    var pickUpTable: [Coffee] = []
    
    mutating func makeCoffee(coffee: Coffee) {
        print("주문한 \(coffee)를 제작합니다")
        pickUpTable.append(coffee)
    }
}

enum Coffee {
    case americano
    case espresso
    case latte
    case mocha
    case macchiato
}
