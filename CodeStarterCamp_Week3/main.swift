//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee = Person(moneyYouHave : nil)
var missKim = Person(moneyYouHave: 10000)
var yagombucks = CoffeeShop(totalSale: 0, menu: [[.americano:4500],[.tea: 2500],[.juice: 3000]], pickUpTable: 5)

yagombucks.takeOrder(drinkType: .juice)
yagombucks.takeOrder(drinkType: .juice)
yagombucks.takeOrder(drinkType: .juice)
print(yagombucks.totalSale)
