//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let misterLee = Person(name: "misterLee", money: 1000)
let missKim = Person(name: "missKim", money: 10000)

let yagombucks = CoffeeShop(barista: misterLee)

missKim.purchaseCoffee(coffeeShop: yagombucks, coffee: Coffee.americano)
print("\(yagombucks.pickUpTable)")
