//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let hong = Person(name: "홍길동", money: 10000)
let yagombucks = CoffeeShop.createCoffeeShop(money: 1000000, menu: [.americano: 3000])

hong.orderCoffee(in: yagombucks, to: .americano)
hong.orderCoffee(in: yagombucks, to: .latte)
yagombucks.createNewMenu(coffee: .latte, price: 5000)
hong.orderCoffee(in: yagombucks, to: .latte)
