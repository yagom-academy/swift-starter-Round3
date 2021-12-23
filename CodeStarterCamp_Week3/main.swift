//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var asset: Int
    func purchaseSomeThing(price: Int) -> Int {
        let remainder = asset - price
        return remainder
    }
}

struct CoffeeShop {
    var sales: Int
    var pickUpTable: Bool
    var baristar: Person
    var menu: Dictionary<Coffee, Int> = [Coffee.americano : 4500,
                                         Coffee.cafeLatte : 5000,
                                         Coffee.cafeMocha : 5000,
                                         Coffee.vanillaLatte : 5000]
    func order(customer: String, coffee: Coffee) {
        print("\(customer) ordered \(coffee)")
    }
    func brewCoffee(customer: String, coffee: Coffee) {
        print("\(customer)'s \(coffee) is now brewing...")
    }
    enum Coffee {
        case americano
        case cafeLatte
        case cafeMocha
        case vanillaLatte
    }
}

var misterLee: Person = Person(asset: 20000)
var missKim: Person = Person(asset: 3000)
var yagombucks: CoffeeShop = CoffeeShop(sales: 0, pickUpTable: false, baristar: misterLee)

yagombucks.order(customer: "missKim", coffee: CoffeeShop.Coffee.americano)
yagombucks.brewCoffee(customer: "missKim", coffee: CoffeeShop.Coffee.americano)
