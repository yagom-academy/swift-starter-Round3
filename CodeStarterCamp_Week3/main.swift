//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


var misterLee: Person = Person(name: "misterLee", money: 0)
var missKim: Person = Person(name: "missKim", money: 1000)

var yagombucks: CoffeeShop = CoffeeShop()
yagombucks.barista = misterLee

yagombucks.addMenu(coffee: Coffee.americano, price: 3500)
yagombucks.addMenu(coffee: Coffee.latte, price: 4000)


missKim.buyCoffee(at: yagombucks, coffee: Coffee.latte)
print("잔액: \(missKim.money)")
print("yagombucks 매출: \(yagombucks.sales)")

missKim.money = 10000
missKim.buyCoffee(at: yagombucks, coffee: Coffee.latte)
print("잔액: \(missKim.money)")
print("yagombucks 매출: \(yagombucks.sales)")
