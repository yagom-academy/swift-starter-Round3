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
    
    mutating func takeOrder(coffee: Coffee) -> Bool {
        var orderAvailability = false
        if let coffeePrice = menu[coffee] {
            revenue += coffeePrice
            orderAvailability = true
        }
        return orderAvailability
    }
    
    mutating func makeCoffee(person: Person, coffee: Coffee) {
        pickUpTable["\(person.name)"] = "\(coffee)"
        if let orderedCoffee = pickUpTable["\(person.name)"] {
            print("\(person.name) 님의 \(orderedCoffee)가 준비되었습니다. 픽업대에서 가져가 주세요.")
        }
    }
}

var misterLee = Person(name: "misterLee", money: 5000)
var missKim = Person(name: "missKim", money: 10000)

var yagomBucks = CoffeeShop(revenue: 0, menu: [Coffee.americano: Coffee.americano.cost, Coffee.latte: Coffee.latte.cost, Coffee.frappuccino: Coffee.frappuccino.cost], barista: misterLee, pickUpTable: [:])

