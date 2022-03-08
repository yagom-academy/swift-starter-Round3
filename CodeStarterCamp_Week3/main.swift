//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


var misterLee = Person(name: "misterLee", age: 25, money: 10000)
var missKim = Person(name: "missKim", age: 27, money: 10000)
var yagomBucks = CoffeeShop(totalRevenue: 0, menu: [Coffee.americano: Coffee.americano.price, Coffee.latte: Coffee.latte.price, Coffee.cappuccino: Coffee.cappuccino.price], barista: misterLee)

missKim.order(coffee: .latte, coffeeShop: yagomBucks, customerName: missKim)
