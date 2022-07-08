//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var haveMoney: Int
    var gender: String
    var country: String
    
    func eatingFood(whatFood: String){
        print("\(whatFood)를 먹습니다.")
    }
    
    func purchaseCoffee(){
        print("커피를 구입합니다.")
    }
}

struct CoffeeShop {
    var sales: Int
    var menu: [String:Int]
    var pickUpTable: [String] = []
    
    mutating func makeCoffee(coffee: String){
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

var misterLee = Person(haveMoney: 5000, gender: "male", country: "korea")
var missKim = Person(haveMoney: 7000, gender: "female", country: "korea")

var yagombucks = CoffeeShop(sales: 0, menu: [:])
