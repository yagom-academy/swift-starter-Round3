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

var yagombucks: CoffeeShop = CoffeeShop(barista: misterLee, sales: 0, menu: [.latte: 4000, .americano: 3500, .lemonade: 5000], pickUpTable: [])
yagombucks.barista = misterLee



missKim.order(.americano, of: yagombucks, by: "missKim")
print(missKim.money)

missKim.order(.lemonade, of: yagombucks, by: "missKim")
print(missKim.money)

missKim.order(.lemonade, of: yagombucks, by: "missKim")
print(missKim.money)

print(yagombucks.sales)

