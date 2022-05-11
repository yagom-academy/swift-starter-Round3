//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee = Person(name: "misterLee", money: 0)
var missKim = Person(name: "missKim", money: 10000)
var yagomBucks = CoffeeShop(barista: misterLee)

missKim.buyCoffee(where: &yagomBucks, coffee: .latte)
print("")
missKim.money = 4000
missKim.buyCoffee(where: &yagomBucks, coffee: .latte)
print("")
missKim.buyCoffee(where: &yagomBucks, coffee: .americano)
