//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee: String {
    case dark = "Dark Coffee"
    case latte = "Latte Coffee"
}

struct Person {
    var money: Int
    func purchaseCoffee() {
        
    }
//    func purchaseCoffee(price: Int) -> Coffee? {
//        if self.money >= price {
//            return .latte
//        }
//
//        return nil
//    }
}

struct CoffeeShop {
    var salesMoney: Int
    var barista: Person
    var menus: [Coffee : Int]
    var pickUpTable = [Coffee]()
    
    mutating func takeOrder(coffee: Coffee) {
        self.makeCoffee(order: coffee)
    }
    
    mutating func makeCoffee(order:Coffee) {
        switch order {
            case .dark:
                self.pickUpTable.append(.dark)
            case .latte:
                self.pickUpTable.append(.latte)
        }
        print("주문하신 \(order.rawValue) 준비완료되었습니다.")
    }
}

let misterLee = Person(money: 5400)
let missKim = Person(money: 6800)
var yagombucks = CoffeeShop(salesMoney: 10000,
                            barista: misterLee,
                            menus: [Coffee.dark:4500, Coffee.latte:5000])

