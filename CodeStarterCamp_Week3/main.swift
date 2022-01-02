//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee : Person = Person(name: "misterLee", haveMoney: 10000, job: "barista")
var missKim : Person = Person(name: "missKim", haveMoney: 20000, job: "none")
var yagombucks : CoffeeShop = CoffeeShop(barista : misterLee)

yagombucks.takeOrderTo(coffee: CoffeeList.espresso)
yagombucks.moveToPickUpTable(coffee: CoffeeList.espresso)

