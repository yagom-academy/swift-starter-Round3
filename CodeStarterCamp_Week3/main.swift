//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

var misterLee = Person(name: "misterLee", money: 10000)
var missKim = Person(name: "missKim", money: 20000)
var haru = Person(name: "haru", money: 0)

var yagombucks = CoffeeShop(sales: 0,
                            menu: [.espresso: 2300, .americano: 2500, .latte: 3500, .vanillaLatte: 4000, .caramelMacchiato: 4300],
                            pickUpTable: [],
                            barista: [haru])

misterLee.order(.espresso, at: yagombucks, by: misterLee.name)
misterLee.order(.americano, at: yagombucks, by: misterLee.name)
misterLee.order(.latte, at: yagombucks, by: misterLee.name)
misterLee.order(.vanillaLatte, at: yagombucks, by: misterLee.name)
misterLee.order(.caramelMacchiato, at: yagombucks, by: misterLee.name)
missKim.order(.vanillaLatte, at: yagombucks, by: missKim.name)
