//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

let misterLee = Person(name: "Mr.Lee", money: 5000)
let missKim = Person(name: "Ms.Kim", money: 10000)
var yagombucks = CoffeeShop(barista: misterLee)

missKim.orderCoffee(.espresso)
yagombucks.takeOrders()
yagombucks.makeCoffee(.espresso)
