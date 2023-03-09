//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var missKim = Person(name: "missKim", money: 3500)
//missKim.buyCoffee(coffeeShop: CoffeeShop(name: "오뚜기", sales: 200, barista: missKim, menu: [.americano: 1500], pickUpTable: []), coffee: .americano)


var yagombucks = CoffeeShop(name: "yagombucks", sales: 0, barista: missKim,
                            menu: [.americano: 2000, .latte: 2900, .javachipFrappuccino: 4500],
                            pickUpTable: [])
yagombucks.order(.americano, from: missKim.name, missKim)
yagombucks.order(.javachipFrappuccino, from: missKim.name, missKim)
yagombucks.order(.latte, from: missKim.name, missKim)
yagombucks.order(.caramelMacchiato, from: missKim.name, missKim)
yagombucks.coffeeOnPickUpTable()
