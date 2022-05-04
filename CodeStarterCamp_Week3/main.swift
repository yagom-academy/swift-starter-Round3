//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// Week3Step1
let misterLee: Person = Person(name: "misterLee", job: "바리스타")
var missKim: Person? = Person(name: "missKim")
var keyster: Person? = Person(name: "keyster")
let yagombucks: CoffeeShop = CoffeeShop(barista: misterLee, cafeName: "yagombucks")

missKim?.buy(kindOf: .americano, at: yagombucks)
print("")
keyster?.buy(kindOf: .espresso, at: yagombucks)
keyster = nil
print("")
missKim?.buy(kindOf: .latte, at: yagombucks)
print("")
missKim?.buy(kindOf: .espresso, at: yagombucks)
print("")
missKim = nil
