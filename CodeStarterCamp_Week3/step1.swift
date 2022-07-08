//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by 임기웅 on 2022/07/08.
//

import Foundation

struct Person {
    var haveMoney: Int
    var gender: String
    var country: String
    
    func eatingFood(whatFood: String){
        print("\(whatFood)를 먹습니다.")
    }
    
    func purchaseCoffee(coffee: Coffee){
        print("\(coffee)를 구입합니다.")
    }
}

struct CoffeeShop {
    var sales: Int
    var barista: Person
    var menu: [String:Int] = [:]
    var pickUpTable: [String] = []
    
    mutating func makeCoffee(coffee: Coffee){
        print("주문한 \(coffee)를 제작합니다")
        pickUpTable.append(coffee.rawValue)
    }
}

enum Coffee: String {
    case americano
    case espresso
    case latte
    case mocha
    case macchiato
}
