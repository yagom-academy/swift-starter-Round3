//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let misterLee: Person = Person(name: "미스터 리", cashInWallet: 10000)
let missKim: Person = Person(name: "미스 김", cashInWallet: 5000)

let menuBoard: Dictionary<Coffee, Int> = [.americano: 2500,
                                          .caffeLatte: 3000,
                                          .cappuccino: 3500,
                                          .macchiato: 4000]
let yagombucks: CoffeeShop = CoffeeShop(name: "야곰벅스",
                                        barista: misterLee,
                                        menuBoard: menuBoard)

missKim.orderCoffee(type: .americano, at: yagombucks)
missKim.orderCoffee(type: .caffeLatte, at: yagombucks)
