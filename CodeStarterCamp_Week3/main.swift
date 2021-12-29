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
    case esprEsso
    case ameriCano
    case cafeLatte
    case vanillaLatte
    case caramelMacchiato
    case cafeMocha
    case affoGato
    
    var cost: Int {
        switch self {
        case .esprEsso:
            return 3000
        case .ameriCano:
            return 4500
        case .cafeLatte:
            return 5000
        case .vanillaLatte:
            return 5500
        case .caramelMacchiato:
            return 5500
        case .cafeMocha:
            return 5700
        case .affoGato:
            return 6000
        }
    }
}

class CoffeeShop {
    var brista: Person
    var customer: Person?
    var menuBoard: Coffee = .ameriCano
    var salesRevenue = 0
    var pickUpTable: String? = nil
    
    init(brista: Person){
        self.brista = brista
    }
    
        func takeOrder(coffee: Coffee, customer: Person) {
        let costOfCoffee = coffee.cost
        salesRevenue += costOfCoffee
        makeCoffees(coffee: coffee)
    }
    
    func makeCoffees(coffee: Coffee) {
        print("\(coffee)를 만드는 중 입니다.!!!")
                pickUpTable = "\(coffee)"
    }
}

var misterLee = Person(name: "Lee", money: 20000)
var missKim = Person(name: "Kim", money: 15000)
var yagombucks = CoffeeShop(brista: misterLee)

  
