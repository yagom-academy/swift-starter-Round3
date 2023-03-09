//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee: Person = Person(money: 0, nickname: "misterLee")
var yagombucks: CoffeeShop = CoffeeShop()
var missKim: Person = Person(money: 10000, nickname: "missKim")

missKim.cafe = yagombucks
missKim.order(.americano)

print(yagombucks.pickUpTable)

print(yagombucks.totalSales)

print(missKim.money)
