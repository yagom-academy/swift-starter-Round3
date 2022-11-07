//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee {
    case iceAmericano, hotAmericano, iceCafeMocha, hotCafeMocha, iceLatte, hotLatte
}

class Person {
    var money: Int
    
    init(money: Int) {
        self.money = money
    }
    
    func buyCoffee(shop: CoffeeShop) {
        var payMoney: Int = 0
        
        for coffee in shop.pickUpTable {
            if let coffeePrice = shop.menu[coffee] {
                payMoney += coffeePrice
            }
        }
        self.money -= payMoney
    }
}

class CoffeeShop {
    var barista: Person?
    var profit: Int = 0
    var menu: [Coffee: Int] = [.iceAmericano: 1800, .hotAmericano: 1500, .iceCafeMocha: 3000, .hotCafeMocha: 2800,
                               .iceLatte: 2600, .hotLatte: 2400]
    var pickUpTable: [Coffee] = []
    
    init(profit: Int) {
        self.profit = profit
    }
    
    init(barista: Person, profit: Int) {
        self.barista = barista
        self.profit = profit
    }
    
    init?(profit: Int, menu: [Coffee: Int]) {
        if menu.count == 0 {
            return nil
        }
        self.profit = profit
        self.menu = menu
    }
    
    func takeOrder(coffees: [Coffee]) {
        var payMoney: Int = 0
        for coffee in coffees {
            if let price = menu[coffee] {
                payMoney += price
            }
        }
        
        self.profit += payMoney
    }
    func makeCoffee(coffees: [Coffee]) {
        self.pickUpTable = coffees
    }
}

let misterLee = Person(money: 50000)
let missKim = Person(money: 1000000)

let yagombucks = CoffeeShop(barista: misterLee, profit: 0)

