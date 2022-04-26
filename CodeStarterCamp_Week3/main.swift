//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee = Person(name: "misterLee", height: 180.0, weight: 70.0, money: 100_000)
var missKim = Person(name: "missKim", height: 165.0, weight: 55.0, money: 200_000)

var yagombucks = CoffeeShop(owner: "yagom", location: "seoul", pickUpTable: true)
yagombucks.barista = misterLee
