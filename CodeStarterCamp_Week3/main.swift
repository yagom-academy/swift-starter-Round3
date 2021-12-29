//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    var money: Int
    func buy(items: String) {
        print("\(items)을 삽니다 ")
    }
}

enum Coffee {
    case espresso
    case americano
    case cafeLatte
    case vanillalatte
    case caramelMacchiato
    case cafemocha
    case affogato
    
    var cost: Int {
        switch self {
        case .espresso:
            return 3000
        case .americano:
            return 4500
        case .cafeLatte:
            return 5000
        case .vanillalatte:
            return 5500
        case .caramelMacchiato:
            return 5500
        case .cafemocha:
            return 5700
        case .affogato:
            return 6000
        }
    }
}

struct CoffeeShop {
    var brista: Person
    var salesRevenue = 0
    var pickUpTable: String? = nil
    
    init(brista: Person){
        self.brista = brista
    }
    
    mutating func takeOrderMenu(coffee: Coffee) {
        let costOfcoffee = coffee.cost
        salesRevenue += costOfcoffee
        print("\(coffee)는 \(costOfcoffee)원 입니다")
        print(salesRevenue)
    }
    func makeCoffeeMenu(coffee: String) {
        print("\(coffee)를 제조중입니다!!!")
    }
}

var misterLee = Person(name: "Lee", money: 20000)
var missKim = Person(name: "Kim", money: 15000)
var yagombucks = CoffeeShop(brista: misterLee)

  
