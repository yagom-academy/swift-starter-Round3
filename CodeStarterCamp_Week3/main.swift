//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee: Person = Person()
var missKim: Person = Person()
var yagombucks = CoffeeShop(barista: misterLee)


let mix = Coffee.mix
yagombucks.menu[mix] = 4000

var coffee = yagombucks.getOrder(orderedCoffee: mix)
