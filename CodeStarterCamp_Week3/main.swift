//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// Step 1: 타입과 인스턴스의 관계
var misterLee: Person = Person(lastName: "Lee", money: 100)
var missKim: Person = Person(lastName: "Kim", money: 10000)

var yagombucks: CoffeeShop = CoffeeShop(barista: misterLee)

print(misterLee.money)
print(missKim.money)
print(yagombucks.barista.lastName)
print(yagombucks.menu)

yagombucks.takeOrderAndCreateCoffee(ordered: Coffee.americano)
yagombucks.takeOrderAndCreateCoffee(ordered: Coffee.cafemocha)
yagombucks.takeOrderAndCreateCoffee(ordered: Coffee.blacktea)
yagombucks.takeOrderAndCreateCoffee(ordered: Coffee.americano)
yagombucks.takeOrderAndCreateCoffee(ordered: Coffee.cafelatte)

print(yagombucks.pickUpTable)
