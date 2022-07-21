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
var yagombucks = CoffeeShop(barista: misterLee, menu: [.cappuccino: 5000])

misterLee.buyCoffee(menu: .cappuccino)
yagombucks.takeOrder(menu: .cappuccino)
yagombucks.makeCoffee(menu: "카푸치노")
