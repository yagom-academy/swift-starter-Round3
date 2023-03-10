//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee: Person = Person(money: 0)
var yagombucks: CoffeeShop = CoffeeShop(barista: misterLee)
var missKim: Person = Person(money: 10000)

missKim.order(.americano, of: yagombucks, by: "미스킴")
yagombucks.barista = missKim

print(yagombucks.totalSales)

print(missKim.money)
