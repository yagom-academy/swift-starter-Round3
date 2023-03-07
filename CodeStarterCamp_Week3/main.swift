//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee = Person(name: "misterLee", money: 3000)
var missKim = Person(name: "missKim", money: 5000)
var yagombucks = CoffeeShop(menu: [Coffee.americano: 3500, Coffee.decafAmericano: 4000, Coffee.vanillaLatte: 3800, Coffee.hazelnutLatte: 3800, Coffee.caramelmacchiato: 3900], barista: misterLee)

missKim.order(Coffee.americano, at: yagombucks)
