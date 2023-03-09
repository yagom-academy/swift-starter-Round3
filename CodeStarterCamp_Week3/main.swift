//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let missKim = Person(name: "missKim", money: 3000)
var yagombucks = CoffeeShop(name: "yagombucks", sales: 0, barista: missKim,
                            menu: [.americano: 2000, .latte: 2900, .javachipFrappuccino: 4500],
                            pickUpTable: [])

missKim.order(.latte, of: yagombucks, by: missKim.name)
