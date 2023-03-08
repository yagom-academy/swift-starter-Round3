//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var missKim = Person(name: "missKim", money: 35000)
missKim.buyCoffee(coffeeShop: CoffeeShop(name: "오뚜기", sales: 200, barista: missKim, menu: [.americano: 1500], pickUpTable: []), coffee: .americano)

var yagombucks = CoffeeShop(name: "yagombucks", sales: 0, barista: missKim,
                            menu: [.americano: 2000, .latte: 2900, .javachipFrappuccino: 4500],
                            pickUpTable: [])
yagombucks.takeOrderCoffee(.americano)
yagombucks.takeOrderCoffee(.latte)
yagombucks.takeOrderCoffee(.caramelMacchiato)
yagombucks.coffeeOnPickUpTable()
