//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

/* Step 1: 타입과 인스턴스의 관계 */
var misterLee = Person(name: "misterLee")
var missKim = Person(name: "missKim", money: 5000)
let yagombucks = CoffeeShop(menu: [.americano: 4500,
                                .latte: 5000,
                                .cappuccino: 5000,
                                .macchiato: 5900],
                            barista: misterLee)
