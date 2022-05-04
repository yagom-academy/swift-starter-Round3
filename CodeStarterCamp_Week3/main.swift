//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(coffee: Coffee, shop: CoffeeShop) {
        guard let price = shop.menu[coffee] else {
            return
        }
        self.money -= price
    }
}

class CoffeeShop {
    var revenue: Int
    var menu: [Coffee : Int]
    var barista: [Person] = []
    var pickUpTable: Bool?
    
    init(revenue: Int, menu: [Coffee: Int]) {
        self.revenue = revenue
        self.menu = menu
    }
    
    func orderedCoffee(coffee: Coffee) {
        guard let coffeePrice = self.menu[coffee] else {
            return
        }
        self.revenue += coffeePrice
    }
}

enum Coffee {
    case espresso
    case americano
    case vanillaLatte
    case cafeMocha
}

let misterLee = Person(name: "Lee JongSuk", money: 10000)
let missKim = Person(name: "Kim Yuna", money: 20000)
let yagombucks = CoffeeShop(revenue: 0, menu: [.espresso : 1000, .americano: 2000, .vanillaLatte: 3000, .cafeMocha: 3500])

yagombucks.barista.append(misterLee)
missKim.buy(coffee: .espresso, shop: yagombucks)
yagombucks.orderedCoffee(coffee: .espresso)
