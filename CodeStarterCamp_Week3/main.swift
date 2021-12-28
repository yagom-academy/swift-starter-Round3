//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let misterLee = Person(name: "Mr.Lee", money: 10000)
let missKim = Person(name: "Ms.Kim", money: 10000)

let yagombucks = CoffeeShop(barista: misterLee)
yagombucks.menuBoard[Coffee.americano] = 3000
yagombucks.menuBoard[Coffee.latte] = 4000
yagombucks.menuBoard[Coffee.espresso] = 2000
