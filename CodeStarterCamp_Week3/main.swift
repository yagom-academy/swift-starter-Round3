//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee: Person = Person(money: 0, nickname: "misterLee")
var yagombucks: CoffeeShop = CoffeeShop(barista: misterLee, totalSales: 0, pickUpTable: [], menu: [Coffee.americano: 2500, Coffee.decaffeine: 2500, Coffee.vanilla: 3500, Coffee.caramel: 3500, Coffee.cappuccino: 3500] )
var missKim: Person = Person(money: 10000, nickname: "missKim")
missKim.orderCofffee(menu: Coffee.americano.rawValue, price: yagombucks.menu[Coffee.americano] ?? 0)
missKim.orderCofffee(menu: Coffee.latte.rawValue, price: yagombucks.menu[Coffee.latte] ?? 0)

var mommy: Person = Person(money: 6000, nickname: "Mommy")
mommy.orderCofffee(menu: Coffee.caramel.rawValue, price: yagombucks.menu[Coffee.caramel] ?? 0)

yagombucks.takeOrder(nickname: missKim.nickname, menu: Coffee.americano.rawValue, price: yagombucks.menu[Coffee.americano] ?? 0)
yagombucks.takeOrder(nickname: missKim.nickname, menu: Coffee.latte.rawValue, price: yagombucks.menu[Coffee.latte] ?? 0)
yagombucks.takeOrder(nickname: mommy.nickname, menu: Coffee.caramel.rawValue, price: yagombucks.menu[Coffee.caramel] ?? 0)

yagombucks.processOrder(nickname: missKim.nickname, menu: Coffee.americano.rawValue)
yagombucks.processOrder(nickname: mommy.nickname, menu: Coffee.caramel.rawValue)
print(yagombucks.pickUpTable)

yagombucks.checkSales()
