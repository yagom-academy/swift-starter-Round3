//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee {
    case americano
    case latte
    case frappuccino
    
    var cost: Int {
        switch self {
        case .americano:
            return 4500
        case .latte:
            return 5000
        case .frappuccino:
            return 5500
        }
    }
}

struct Person {
    let name: String
    var money: Int
    
    mutating func buyProduct(productName: Coffee) -> Bool {
        var buyAvailability = false
        if self.money >= productName.cost {
            self.money -= productName.cost
            buyAvailability = true
        }
        return buyAvailability
    }
    
    func printPurchaseResult (buyAvailability: Bool, productName: Coffee) {
        if buyAvailability {
            print("\(self.name) paid \(productName.cost) for \(productName)")
        } else {
            print("잔액이 {\((productName.cost) - self.money)}원만큼 부족합니다.")
        }
    }
}

struct CoffeeShop {
    var revenue: Int
    let menu: [Coffee: Int]
    let barista: Person
    var pickUpTable: [String: String]
    
    mutating func takeOrder(person: Person, coffee: Coffee) {
        var orderAvailability = false
        if let coffeePrice = menu[coffee] {
            revenue += coffeePrice
            orderAvailability = true
        }
        makeCoffee(orderAvailability: orderAvailability, person: person, coffee: coffee)
    }
    func makeCoffee(orderAvailability: Bool, person: Person, coffee: Coffee) {
        if orderAvailability {
            print("we made \(coffee) for \(person.name)")
        } else {
            print("We don't have \(coffee) in our store")
        }
        
    }
}

var misterLee = Person(name: "misterLee", money: 10000)
var missKim = Person(name: "missKim", money: 20000)

var yagomBucks = CoffeeShop(revenue: 0, menu: [Coffee.americano: 4500, Coffee.latte: 5000, Coffee.frappuccino: 5500], barista: misterLee, pickUpTable: [:])

