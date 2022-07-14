//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var missKim = Person(money: 20000, name: "missKim", gender: "female", country: "korea")
var misterLee = Person(money: 5000, name: "misterLee" , gender: "male", country: "korea")
var yagombucks = CoffeeShop(barista: misterLee)

missKim.purchaseCoffee(Coffee.americano, coffeeShop: yagombucks)
missKim.purchaseCoffee(Coffee.mocha, coffeeShop: yagombucks)
missKim.purchaseCoffee(Coffee.latte, coffeeShop: yagombucks)
