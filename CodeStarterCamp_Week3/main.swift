//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


var misterLee: Person = Person(name: "misterLee")
var missKim: Person = Person(name: "missKim")

var yagombucks: CoffeeShop = CoffeeShop()
yagombucks.barista = misterLee

yagombucks.addMenu(coffee: Coffee.americano, price: 3500)
yagombucks.addMenu(coffee: Coffee.latte, price: 4000)

missKim.money = 10000

missKim.buyCoffee(coffee: Coffee.latte)
