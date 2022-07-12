//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var missKim = Person(money: 2000, name: "missKim", gender: "female", country: "korea")
var misterLee = Person(money: 5000, name: "misterLee" , gender: "male", country: "korea")
var yagombucks = CoffeeShop(sales: 0, barista: misterLee)

missKim.purchaseCoffee(Coffee.americano, shop: yagombucks)
missKim.purchaseCoffee(Coffee.mocha, shop: yagombucks)
