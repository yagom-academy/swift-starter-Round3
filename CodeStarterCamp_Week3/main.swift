//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


let tom: Person = Person(name: "Tom",money: 50000)
let jerry: Person = Person(name: "Jerry",money: 100000)
let mike: Person = Person(name: "Mike",money: 200000)
let jane: Person = Person(name: "Jane",money: 300000)
let missKim: Person = Person(name: "김미나",money: 0)

let yagombucks: CoffeeShop = CoffeeShop(menu: [.americano: 1000,
                                              .latteMacchiato: 1500,
                                              .cappuccino: 2000],
                                       barista: tom)

jerry.order(.espresso, of: yagombucks, by: jerry.name)
jerry.order(.americano, of: yagombucks, by: jerry.name)
missKim.order(.cappuccino, of: yagombucks, by: missKim.name)
