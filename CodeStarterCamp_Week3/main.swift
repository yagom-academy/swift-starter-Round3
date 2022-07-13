//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var missKim: Person = Person(name: "missKim", age: 25, money: 3000)
var misterLee: Person = Person(name: "misterLee", age: 25, money: 1000)
var yagombucks: CoffeeShop = CoffeeShop(coffeeShopName: "YagomBucks", todayRevenue: 1000, barista: misterLee)

missKim.order(coffee: .americano, coffeeShop: yagombucks)

