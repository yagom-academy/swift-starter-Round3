//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee = Person(money: 10000)
var missKim = Person(money: 10000)
var yagombucks = CoffeeShop(barista: misterLee)

misterLee.buyCoffee(menu: "카푸치노")
yagombucks.takeOrder(menu: "카푸치노")
yagombucks.makeCoffee(menu: "카푸치노")
