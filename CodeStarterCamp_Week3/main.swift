//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var missKim: Person = Person(name: "missKim", age: 24, money: 10000)
let misterHong: Person = Person(name: "misterHong", age: 26, money: 40000)
let yagombucks: CoffeeShop = CoffeeShop(sales: 0)

yagombucks.barista = misterHong
missKim.buyCoffee(.복숭아스무디, yagombucks)
