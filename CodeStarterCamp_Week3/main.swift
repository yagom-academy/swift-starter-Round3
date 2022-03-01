//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let misterLee = Person(name: "Cheolsoo", money: 10000)
let missKim = Person(name: "Younghee", money: 10000)

let yagombuks = CoffeeShop(baristas: [misterLee], menu: [Coffee.espresso: 3000, Coffee.americano: 3500])

missKim.buy(Coffee.americano.name)

var str = "bla bla"
print(capitalize(what: str))

