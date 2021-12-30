//


//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterKim: Person = Person(money: 100000, name: "misterKim")
var yagombucks: CoffeeShop = CoffeeShop(barista: misterKim, totalSales: 0)

misterKim.money = yagombucks.order(customer: misterKim, coffee: Coffee.milk, coffeeShop:yagombucks)
misterKim.takeCoffee(coffee: Coffee.milk, coffeeShop: yagombucks)
