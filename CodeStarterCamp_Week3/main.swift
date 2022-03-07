//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// MARK: step1
//var misterLee = Person(property: 0)
//var missKim = Person(property: 10000)
//var yagombucks = CoffeeShop(totalSale: 0, baristas: misterLee)
//
//yagombucks.takeOrder(drinkType: .juice)
//yagombucks.takeOrder(drinkType: .juice)
//yagombucks.takeOrder(drinkType: .juice)
//print(yagombucks.totalSale)

// MARK: step2
var misterLee = Person(name: "misterLee", property: 10000)
var yagombucks = CoffeeShop(baristas: misterLee)

misterLee.buy(beverage: .americano(price: 4500), in: yagombucks)
misterLee.buy(beverage: .tea(price: 2500), in: yagombucks)
misterLee.buy(beverage: .tea(price: 2500), in: yagombucks)
misterLee.buy(beverage: .tea(price: 3000), in: yagombucks)
