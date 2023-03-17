//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee = Person(name: "Lee", money: 20000)
var missKim = Person(name: "Kim", money: 30000)

var yagombucks = CoffeeShop(menu: [Coffee.americano: 2500, Coffee.caramelMacchiato: 3500, Coffee.latte: 3000, Coffee.caffeMocha: 3000], barista: misterLee)

missKim.order(Coffee.americano, of: yagombucks, by: "missKim")
