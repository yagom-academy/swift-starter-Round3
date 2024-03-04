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
var yagombucks = CoffeeShop(brista: misterLee)


let coffeePrice = yagombucks.takeCoffeeOrder(
    nickName: missKim.nickName,
    coffee: missKim.orderCoffee(coffee: Coffee.americano))

yagombucks.processPayment(paidMoney: missKim.payPrice(price: coffeePrice))
yagombucks.makeCoffee()

if !yagombucks.pickupTable.isEmpty {
    missKim.takeMyCoffee(coffee: yagombucks.pickupTable[0])
    yagombucks.pickupTable.remove(at: 0)
}
