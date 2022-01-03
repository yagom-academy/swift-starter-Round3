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
var yagombucks = CoffeeShop(barista: misterLee)

let menu: Dictionary<Coffee, Int> = [.arrabica:1000,.yogu:2000,.mix:4000]
missKim.money = 3000
yagombucks.menu = menu
yagombucks.getOrder(person: &missKim, orderedCoffee: .mix)
yagombucks.getOrder(person: &missKim, orderedCoffee: .yogu)
