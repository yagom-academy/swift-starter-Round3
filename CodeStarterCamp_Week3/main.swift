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
var yagombuks: CoffeeShop = CoffeeShop(sales: 0, barista: misterLee, menu: menu)

missKim.order(_ : .americano, of: yagombuks)
Coda.order(_ : .cappuccino, of: yagombuks)
missKim.order(_ : .cafeLatte, of: yagombuks)











