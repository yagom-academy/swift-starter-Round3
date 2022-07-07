//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee: Person = Person(name: "misterLee", age: 25, money: 6000)
var missKim: Person = Person(name: "missKim", age: 27, money: 5000)
var yagombucks: CoffeeShop = CoffeeShop(coffeeShopName: "yagombucks", todayRevenue: 4000, barista: missKim)

yagombucks.orderedMenu(coffee: .americano)
