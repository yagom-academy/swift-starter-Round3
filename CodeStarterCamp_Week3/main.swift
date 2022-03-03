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
    private var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    mutating func canBuy(productName: Coffee) -> Bool {
        var buyAvailability = false
        if self.money >= productName.cost {
            buyAvailability = true
        }
        return buyAvailability
    }
    
    mutating func printPurchaseResult (buyAvailability: Bool, productName: Coffee) {
        if buyAvailability {
            self.money -= productName.cost
            print("\(self.name) paid \(productName.cost) for \(productName)")
        } else {
            print("잔액이 {\((productName.cost) - self.money)}원만큼 부족합니다.")
        }
    }
}

struct CoffeeShop {
    var revenue: Int
    let menu: [Coffee: Int]
    private let barista: Person
    private var pickUpTable: Array<String> {
        willSet (newName) {
            guard let personName = newName.first else { return }
            print("\(personName) 님의 커피가 준비되었습니다. 픽업대에서 갖져가 주세요.")
        }
    }
    
    init(revenue: Int, menu: [Coffee: Int], barista: Person, pickUpTable: Array<String>) {
        self.revenue = revenue
        self.menu = menu
        self.barista = barista
        self.pickUpTable = pickUpTable
    }
    
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

if missKim.buyProduct(productName: Coffee.americano) {
    missKim.printPurchaseResult(buyAvailability: true, productName: .americano)
    if yagomBucks.takeOrder(coffee: .americano) {
        yagomBucks.makeCoffee(person: missKim, coffee: .americano)
    }
} else {
    missKim.printPurchaseResult(buyAvailability: false, productName: .americano)
}
