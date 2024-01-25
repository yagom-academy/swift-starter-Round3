//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let missKim: Person = Person(name: "Kim", weight: 150, height: 40, nationality: "Korea", mbti: "ESTP", money: 1000)
let yagombucks: CoffeeShop = CoffeeShop(
    name: "yagombucks",
    address: "어디도 어디시 어디동 xx로",
    phoneNumber: "010-xxxx-xxxx",
    sales: 0,
    menus: [ .americano: 3000, .espresso: 4000, .cappuccino: 4000]
)

missKim.order(.espresso, of: yagombucks, by: missKim.name)


