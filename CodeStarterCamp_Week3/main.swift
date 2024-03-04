//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

let misterLee = Person(money: 10000)
let missKim = Person(money: 20000)
let yagombucks = CoffeeShop(sales: 0,
                            menu: [.espresso: 2300, .americano: 2500, .latte: 3500, .vanillaLatte: 4000, .caramelMacchiato: 4300],
                            pickUpTable: [],
                            barista: "HARU")

misterLee.order(.espresso, at: yagombucks, by: "misterLee")
misterLee.order(.americano, at: yagombucks, by: "misterLee")
misterLee.order(.latte, at: yagombucks, by: "misterLee")
misterLee.order(.vanillaLatte, at: yagombucks, by: "misterLee")
misterLee.order(.caramelMacchiato, at: yagombucks, by: "misterLee")
missKim.order(.vanillaLatte, at: yagombucks, by: "missKim")
