//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee = Person(name: "misterLee", money: 3000)
var missKim = Person(name: "missKim", money: 10000)
let yagombucksMenu: [Coffee: Int] = [
    .americano: 3500,
    .decafAmericano: 4000,
    .vanillaLatte: 3800,
    .caramelmacchiato: 3900
]
var yagombucks = CoffeeShop(name: "yagombucks", menu: yagombucksMenu, barista: misterLee)

missKim.order(.americano, of: yagombucks, by: missKim.name)
missKim.order(.decafAmericano, of: yagombucks, by: missKim.name)
missKim.pickUp(.americano, of: yagombucks, by: missKim.name)
missKim.order(.vanillaLatte, of: yagombucks, by: missKim.name)
missKim.order(.hazelnutLatte, of: yagombucks, by: missKim.name)
