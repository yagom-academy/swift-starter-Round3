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
    
    mutating func buyCoffee(where coffeeShop: CoffeeShop, order: [Coffee: Int]) {
        var totalPrice: Int = 0
        for (coffee, amount) in order {
            totalPrice += coffee.price * amount
        }
        var store: CoffeeShop
        store = coffeeShop
        
        guard self.money >= totalPrice else {
            print("잔액이 \(totalPrice - self.money)만큼 부족합니다.")
            return
        }
        
        self.money -= totalPrice
        store.sales += totalPrice
        
        store.takeOrder(client: self, order: order)
    }
}


struct CoffeeShop {
    var sales: Int
    var pickUpTable: [Coffee: Int]
    var barista: Person?
    
    mutating func takeOrder(client: Person, order: [Coffee: Int]) {
        self.makeCoffee(clientName: client.name, orderedCoffee: order)
    }
    mutating func makeCoffee(clientName: String, orderedCoffee: [Coffee: Int]) {
        self.pickUpTable = orderedCoffee
        
        print("\(clientName) 님이 주문하신 ", terminator: "")
        for (coffee, amount) in self.pickUpTable {
            print("\(coffee.rawValue) \(amount)잔", terminator: " ")
        }
        print("(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

enum Coffee: String {
    case americano = "아메리카노", latte = "라떼", cappuccino = "카푸치노"

    var price: Int {
        get {
            switch self {
            case .americano:
                return 3
            case .latte:
                return 4
            case .cappuccino:
                return 5
            }
        }
    }
}

var misterLee = Person(name: "misterLee", money: 100)
var missKim = Person(name: "missKim", money: 3)
var yagombucks = CoffeeShop(sales: 0, pickUpTable: [:], barista: misterLee)

missKim.buyCoffee(where: yagombucks, order: [Coffee.americano: 1])
missKim.buyCoffee(where: yagombucks, order: [Coffee.americano: 1, Coffee.latte: 2])
misterLee.buyCoffee(where: yagombucks, order: [Coffee.americano: 1, Coffee.latte: 2])
