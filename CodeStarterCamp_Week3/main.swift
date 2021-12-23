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
    func buy(item: String) {
        print("\(item)을 삽니다.")
    }
}

enum Coffee {
    case espresso
    case americano
    case cafeLatte
    case cafeMocha
    case flatWhite
    
    var cost: Int {
        switch self {
        case .espresso:
            return 3000
        case .americano:
            return 4000
        case .cafeLatte:
            return 5000
        case .cafeMocha:
            return 5000
        case .flatWhite:
            return 5000
        }
    }
}

struct CoffeeShop {
    var brista: Person
    var salesRevenue = 0
    var pickUpTable: String? = nil
    
    init(brista: Person) {
           self.brista = brista
    }

    mutating func takeOrder(coffee: Coffee) {
        let costOfcoffee = coffee.cost
            salesRevenue += costOfcoffee
            print("\(coffee)는 \(costOfcoffee)원 입니다.")
            print(salesRevenue)
        
    }
    func makeCoffees(coffee: String) {
        print("\(coffee)를 만드는 중 입니다.")
    }
}

var misterLee = Person(name: "Lee", money: 10000)
var missKim = Person(name: "Kim", money: 10000)
var yagombucks = CoffeeShop(brista: misterLee)
