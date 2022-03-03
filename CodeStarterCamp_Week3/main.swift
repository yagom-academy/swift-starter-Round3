//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee = Person(property: 0)
var missKim = Person(property: 10000)
var yagombucks = CoffeeShop(totalSale: 0, baristas: misterLee)

yagombucks.takeOrder(drinkType: .juice)
yagombucks.takeOrder(drinkType: .juice)
yagombucks.takeOrder(drinkType: .juice)
print(yagombucks.totalSale)
