//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let misterLee = Person(name: "misterLee", height: 180.0, weight: 70.0)
let missKim = Person(name: "missKim", height: 165.0, weight: 55.0, money: 200_000)

let yagombucks = CoffeeShop(owner: "yagom", location: "seoul", barista: misterLee)
var yagomsMenu: [Coffee: Int] = [
    .americano: 2500,
    .caffelatte: 2500,
    .caffeMocha: 3000,
    .caramelMacchiato: 3000
]

yagombucks.add(menu: yagomsMenu)

missKim.buy(coffee: .americano, at: yagombucks)
