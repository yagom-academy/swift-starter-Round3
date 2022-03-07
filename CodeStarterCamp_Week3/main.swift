//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee: Person = Person(money: 10000)
var missKim: Person = Person(money: 20000)

var yagomBucks: CoffeeShop = CoffeeShop(amerianoPrice: 2000, cafeLattePrice: 2500, vanilaLattePrice: 3000, cafeMocaPrice: 3500, chocoLattePrice: 4000)

yagomBucks.barista = misterLee
yagomBucks.takeOrder(coffee: .americano)

