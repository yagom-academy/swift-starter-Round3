//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var asset: Int
    var name: String
    func orderCoffee(coffeeShop: CoffeeShop, coffee: Coffee) {
        print("\(name) ordered \(coffee)")
        coffeeShop.takeOrder(coffee: coffee)
    }
    
    init(name: String, asset: Int) {
        self.name = name
        self.asset = asset
    }
}

var missKim: Person = Person(name: "missKim", asset: 3000)
var marisol: Person = Person(name: "marisol", asset: 50000)
var yagombucks: CoffeeShop = CoffeeShop()

yagombucks.customer = marisol
marisol.orderCoffee(coffeeShop: yagombucks, coffee: .americano)
marisol.orderCoffee(coffeeShop: yagombucks, coffee: .cafeMocha)
marisol.orderCoffee(coffeeShop: yagombucks, coffee: .cafeLatte)
yagombucks.customer = missKim
missKim.orderCoffee(coffeeShop: yagombucks, coffee: .vanillaLatte)
