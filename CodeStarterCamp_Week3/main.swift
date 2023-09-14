//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let misterLee = Person(name: "Mr.Lee", money: 10000)
let missKim = Person(name: "Miss.Kim", money: 8000)
let yagombucksMenu: [Coffee: Int] = [
    .americano : 3000,
    .latte : 3500,
    .cappuccino : 4000,
    .mocha : 4500
]

let yagombucks = CoffeeShop(menu: yagombucksMenu)
yagombucks.barista = misterLee
