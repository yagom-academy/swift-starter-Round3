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
let misterJeong = Person(name: "Sangsoo", money: 500)

let yagombuks = CoffeeShop(name: "yagombuks", baristas: [misterLee], menu: [Coffee.espresso: 3000, Coffee.americano: 3500])

missKim.order(Coffee.espresso, at: yagombuks)
print("=====================구분선=====================")
misterJeong.order(Coffee.americano, at: yagombuks)
//yagombuks.make(Coffee.espresso)
//print(yagombuks.pickUpTable)
//missKim.pay(for: Coffee.espresso, at: yagombuks)
//
//
//
//let a = Date()
//
//
//


