//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let misterLee = Person(nickName: "미스터리", money: 5000)
var missKim = Person(nickName: "미스김", money: 6000)
var yagombucks = CoffeeShop(barista: misterLee)


let orderedCoffee = yagombucks.takeCoffeeOrder(customer: missKim, coffee: missKim.orderCoffee(coffee:Coffee.americano))

yagombucks.processPayment(paidMoney: missKim.payPrice(possible: missKim.canIPay(price: orderedCoffee)))
yagombucks.makeCoffee(order: yagombucks.currentOrder)
