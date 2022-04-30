//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let misterLee: Person = Person(name: "misterLee", age: 25, money: 25000)
let missKim: Person = Person(name: "missKim", age: 24, money: 20000)
let yagombucks: CoffeeShop = CoffeeShop(barista: misterLee)

misterLee.introduce()
missKim.introduce()
missKim.buyCoffee()
yagombucks.getOrder()
yagombucks.makeCoffee()
