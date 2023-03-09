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
var missKim = Person(totalMoney: 1000)

var yagombucks = CoffeShop(
    menus: [
        CoffeShop.Menu(coffeeKind: .Americano, price: 400),
        CoffeShop.Menu(coffeeKind: .CaffeeLatte, price: 500),
        CoffeShop.Menu(coffeeKind: .CaffeeMocha, price: 1000)
    ])


yagombucks.takeOrder(person: missKim, coffees: [.Americano])

yagombucks.barista = misterLee

yagombucks.takeOrder(person: missKim, coffees: [.Americano, .CaffeeMocha])

missKim.totalMoney = 10000

yagombucks.takeOrder(person: missKim, coffees: [.Americano, .CaffeeMocha])
