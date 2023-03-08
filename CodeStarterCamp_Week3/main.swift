//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee: Person = Person(money: 0, nickname: "misterLee")
var yagombucks: CoffeeShop = CoffeeShop(barista: misterLee, totalSales: 0, pickUpTable: [])
var missKim: Person = Person(money: 100, nickname: "missKim")

missKim.order(.americano)

var mommy: Person = Person(money: 6000, nickname: "Mommy")
//mommy.order(.americano)

yagombucks.takeOrder(from: missKim)
yagombucks.takeOrder(from: mommy)

print(yagombucks.pickUpTable)

yagombucks.checkSales()

print(missKim.money)
print(mommy.money)
