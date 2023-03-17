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

var yagombucks = CoffeeShop(menu: [.americano: 2500, .caramelMacchiato: 3500, .latte: 3000, .caffeMocha: 3000], barista: misterLee)

missKim.order(.americano, of: yagombucks, by: missKim.name)
