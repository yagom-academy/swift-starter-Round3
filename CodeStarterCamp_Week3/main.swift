//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee: Person = Person(name: "misterLee", money: 3000)
var missKim: Person = Person(name: "missKim", money: 3000)
var yagombucks = CoffeeShop(barista: misterLee)


yagombucks.menu = [.arrabica:1000,.yogu:2000,.mix:4000]
yagombucks.getOrder(person: missKim, orderedCoffee: .mix)
yagombucks.getOrder(person: missKim, orderedCoffee: .yogu)
missKim.getProduct(product: yagombucks.pickUpTable as Any)
