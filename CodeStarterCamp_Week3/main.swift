//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation



var misterLee: Person = Person(money: 1000, name: "misterLee")
var missKim: Person = Person(money: 10000, name: "missKim")
var charles = Person(money: 50000, name: "charles")

var yagombucks: CoffeeShop = CoffeeShop(barista: misterLee, sales: 0, menu: [.latte: 4000, .americano: 3500, .lemonAde: 5000], pickUpTable: [])
yagombucks.barista = misterLee



missKim.order(.americano, of: yagombucks, by: "missKim")
print(missKim.money)

missKim.order(.lemonAde, of: yagombucks, by: "missKim")
print(missKim.money)

missKim.order(.latte, of: yagombucks, by: "missKim")
print(missKim.money)

charles.order(.grapefruitAde, of: yagombucks, by: "charles")
print(charles.money)

charles.order(.lemonAde, of: yagombucks, by: "chrles")
print(charles.money)

print(yagombucks.sales)

