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
var missKim: Person = Person(money: 10000, nickname: "missKim")

missKim.order(.americano)
missKim.order(.latte)
//missKim.order(_coffee: Coffee.caramel)
//missKim.order(menu: Coffee.latte.rawValue)

var mommy: Person = Person(money: 6000, nickname: "Mommy")
//mommy.order(_coffee: Coffee.americano)

yagombucks.takeOrder(from: missKim)
//yagombucks.takeOrder(nickname: missKim.nickname, order: Coffee.caramel)
//yagombucks.takeOrder(nickname: missKim.nickname, order: Coffee.latte)
//yagombucks.takeOrder(nickname: missKim.nickname, menu: Coffee.latte.rawValue, price: yagombucks.menu[Coffee.latte])
//yagombucks.takeOrder(nickname: mommy.nickname, menu: Coffee.caramel.rawValue, price: yagombucks.menu[Coffee.caramel])

//yagombucks.processOrder(nickname: missKim.nickname, menu: Coffee.americano.rawValue)
//yagombucks.processOrder(nickname: mommy.nickname, menu: Coffee.caramel.rawValue)
print(yagombucks.pickUpTable)

yagombucks.checkSales()
print(missKim.money)
