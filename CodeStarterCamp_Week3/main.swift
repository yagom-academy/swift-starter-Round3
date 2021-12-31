//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee : Person = Person()
misterLee.name = "misterLee"
misterLee.haveMoney = 20000
misterLee.job = "barista"
var missKim : Person = Person()
missKim.name = "missKim"
var yagombucks : CoffeeShop = CoffeeShop(barista : misterLee)

yagombucks.takeOrderTo(menu: CoffeeList.espresso)
yagombucks.takeOrderMakeCoffee(coffee: CoffeeList.espresso)
