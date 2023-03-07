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
    func purchaseCoffee() {}
}

struct CoffeeShop {
    var totalSales: Int
    var barista: Person
    var menus: [Coffee:Int]
    var pickUpTable = [Coffee]()
    
    mutating func takeOrder(coffee: Coffee) {
        self.makeCoffee(order: coffee)
    }
    
    private
    mutating func makeCoffee(order: Coffee) {
        self.pickUpTable.append(order)
        print("주문하신 \(order.rawValue) 준비완료되었습니다.")
    }
}

let misterLee = Person(money: 5400)
let missKim = Person(money: 6800)
var yagombucks = CoffeeShop(totalSales: 10000,
                            barista: misterLee,
                            menus: [Coffee.dark:4500, Coffee.latte:5000])

