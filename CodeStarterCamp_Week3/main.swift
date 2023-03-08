//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee: String {
    case americano
    case latte
    case javachipFrappuccino
    case caramelMacchiato
}

var missKim = Person(name: "missKim", money: 9700)
var misterLee = Person(name: "misterLee", money: 9700)
missKim.buyCoffee(coffeeShop: CoffeeShop(name: "오뚜기", sales: 200, barista: misterLee, menu: [.americano: 1500], pickUpTable: []), coffee: .americano)

var yagombucks = CoffeeShop(name: "yagombucks", sales: 0, barista: misterLee,
                            menu: [.americano: 2000, .latte: 2900, .javachipFrappuccino: 4500],
                            pickUpTable: [])
yagombucks.takeOrderCoffee(coffeeMenu: .americano)
yagombucks.takeOrderCoffee(coffeeMenu: .latte)
yagombucks.takeOrderCoffee(coffeeMenu: .caramelMacchiato)
yagombucks.coffeeOnPickUpTable()
