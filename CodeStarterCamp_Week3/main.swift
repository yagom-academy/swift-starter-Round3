//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation



var misterLee: Barista = Barista(name: "MrLee", money: 50000)
var missKim: Person = Person(name: "MsKim", money: 100000)
var yagomBucks: CoffeeShop = CoffeeShop(menu: [.americano, .cafeLatte, .hotChocolate, .cappuccino])


missKim.money = 3000
missKim.buyCoffee(at: yagomBucks, coffee: .americano)

missKim.money = 10000
yagomBucks.barista = nil
missKim.buyCoffee(at: yagomBucks, coffee: .hotChocolate)

yagomBucks.barista = misterLee
missKim.buyCoffee(at: yagomBucks, coffee: .cappuccino)
