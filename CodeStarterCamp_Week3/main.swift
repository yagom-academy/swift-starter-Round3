//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var misterLee: Person = Person(money: 2000, name: "이철호")
var missKim: Person = Person(money: 1500, name: "missKim")
var Coda: Person = Person(money: 1500, name: "Coda")
var yagombuks: CoffeeShop = CoffeeShop(sales: 0, barista: misterLee, menu: menu, pickUpTable: pickUpTable)

missKim.order(_ : .americano, of: yagombuks, by: missKim.name)
Coda.order(_ : .cappuccino, of: yagombuks, by: Coda.name)
missKim.order(_ : .cafeLatte, of: yagombuks, by: missKim.name)









