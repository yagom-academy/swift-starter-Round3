//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee = Person(haveMoney: 5000, gender: "male", country: "korea")
var missKim = Person(haveMoney: 7000, gender: "female", country: "korea")
var yagombucks = CoffeeShop(sales: 0, barista: misterLee)

yagombucks.makeCoffee(coffee: Coffee.americano)
yagombucks.makeCoffee(coffee: Coffee.espresso)
print(yagombucks.pickUpTable)
