//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let yagomBucks = CoffeeShop(name: "야곰벅스", totalProfit: 0, pickupTable: [])

let missKim = Person(name: "미스킴", money: 10000, gender: .female, store: yagomBucks)
let missKimGrandmother = OlderPerson(name: "미스킴 할머니", money: 8000, gender: .female, store: yagomBucks)

missKim.selectCoffee(chose: .americano, for: 2)
missKim.orderCoffee()

missKimGrandmother.selectSoup(chose: .potato)
missKimGrandmother.orderSoup()

// 문제 해결 - 쓰레기 값...
