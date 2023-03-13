//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

typealias CoffeePrice = Int

var misterLee: Person = Person(money: 1000)
var missKim: Person = Person(money: 2000)

var yagombucks: CoffeShop = CoffeShop(sales: 0, menu: [:], pickUpTable: [])
yagombucks.barista = misterLee


