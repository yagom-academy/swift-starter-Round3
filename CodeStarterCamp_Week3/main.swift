//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let misterLee = Person()
let missKim = Person(money: 10000000)

let yagombucks = CoffeeShop(money: 10000000)

//missKim.orderCoffee(in: yagombucks, to: .americano)

missKim.order(.americano, of: yagombucks, by: "missKim")
misterLee.order(.latte, of: yagombucks, by: "커피를 못 마시는 짱구")
