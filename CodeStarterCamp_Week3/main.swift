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

let yagombuks = CoffeeShop(baristas: [misterLee], menu: [Beverages.Coffee.espresso: 3000, Beverages.Coffee.americano: 3500])

print(Beverages.Coffee.espresso.name)
