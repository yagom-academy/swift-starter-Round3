//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var missKim: Person = Person(name: "Kim", money: 10000)
var yagombucks = CoffeeShop(sales: 0)

missKim.order(Coffee.cafeMocha, coffeeShop: yagombucks)
