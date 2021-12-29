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
yagombucks.menuBoard = [.americano:3000, .latte:4000, .espresso:2000]

yagombucks.orderCoffee(coffee: .americano, amount: 1, guest: missKim)
print("\(missKim.money)")
