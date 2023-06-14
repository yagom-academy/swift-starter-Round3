//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var missKim: Person = Person(name: "missKim", money: 6000)
var employee: Person = Person(name: "미르", money: 3000)
var yagombucks: CoffeeShop = CoffeeShop(barista: employee, profit: 0, menuboard: [:], pickUpTable: ())

missKim.order(coffee: .americano, coffeeshop: yagombucks)
yagombucks.make(Coffee.americano, for: "missKim")
yagombucks.coffeeShopprofit(coffee: .americano)
