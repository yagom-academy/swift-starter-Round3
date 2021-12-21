//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var name: String
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
}

var menuBoard: [String: Int] = [:]
menuBoard["espresso"] = 3000
menuBoard["americano"] = 4000
menuBoard["cafeLatte"] = 5000
menuBoard["cafeMocha"] = 5000
menuBoard["flatWhite"] = 5000

struct CoffeeShop {
    var brista: Person
    var salesRevenue = 0
    var menu: [String: Int] = menuBoard
    var pickUpTable: String? = nil
    
    init(staff brista: Person) {
           self.brista = brista
    }

    mutating func takeAOrder(coffee: Coffee) {
        if let cost = menuBoard["\(coffee)"] {
            salesRevenue = salesRevenue + cost
            print("\(coffee)는 \(cost)원 입니다.")
            print(salesRevenue)
        }
    }
    func makeACoffeec(coffee: String) {
        print("\(coffee)를 만드는 중 입니다.")
    }
}

var misterLee = Person(name: "Lee", money: 10000)
var missKim = Person(name: "Kim", money: 10000)
var yagombucks = CoffeeShop(staff: misterLee)
