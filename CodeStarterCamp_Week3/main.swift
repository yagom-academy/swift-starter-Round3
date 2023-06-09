//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let misterLee = Person(name: "misterLee", money: 10_000)
let missKim = Person(name: "missKim", money: 1_000)
let mrKim = Person(name: "msKim", money: 100_000)

let menu: [Coffee: Int] = [
    .Americano: 1500,
    .Latte: 3000,
    .CafeMoca: 4500
]

let yagomBucks = CoffeeShop(name: "yagomBucks", menu: menu, barista: misterLee)

yagomBucks.showMenu()
print("")

missKim.buy(coffee: [.Americano, .CafeMoca], to: yagomBucks)
print("")

mrKim.buy(coffee: [.Americano, .CafeMoca], to: yagomBucks)

