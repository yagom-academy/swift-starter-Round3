//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

/**
 Step 1: 타입과 인스턴스의 관계
 */

var misterLee = Person(totalMoney: 10000)
var missKim = Person(totalMoney: 100)
var missPark = Person(totalMoney: 10000)

var yagombucks = CoffeShop(menus: [CoffeShop.Menu(coffee: .Americano, price: 400),
                                   CoffeShop.Menu(coffee: .CaffeeLatte, price: 500)])


yagombucks.takeOrder(person: missKim, coffees: .CaffeeMocha)

yagombucks.barista = misterLee

yagombucks.takeOrder(person: missKim)

yagombucks.takeOrder(person: missKim, coffees: .Americano)

missKim.totalMoney = 10000

yagombucks.takeOrder(person: missKim, coffees: .CaffeeMocha, .Americano)

yagombucks.takeOrder(person: missKim, coffees: .Americano, .CaffeeLatte)

yagombucks.barista = missPark

yagombucks.takeOrder(person: missKim, coffees: .Americano, .Americano, .Americano)

print("영업 종료 : 총 매출액 \(yagombucks.salesRevenue)원")
