//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterKim: Person = Person(money: 100000, name: "misterKim")
var yagombucks: CoffeeShop = CoffeeShop(menu: [], barista: misterKim, totalSales: 0, pickUpTable: [])
print("내잔액 :\(misterKim.money)")
yagombucks.order(customer: misterKim, coffee: Coffee.milk, coffeeShop: yagombucks)
print("내잔액 :\(misterKim.money)")
misterKim.takeCoffee(coffee: Coffee.milk, coffeeShop: yagombucks)
