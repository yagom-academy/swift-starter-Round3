//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let misterLee = Person(name: "미스터리", money: 5000)
var missKim = Person(name: "미스김", money: 6000)
var yagombucks = CoffeeShop(barista: misterLee, menu: [.americano: 4000, .cafeLatte: 4500, .oatLatte: 4500, .milkTea: 5000])

missKim.order(Coffee.milkTea, of: yagombucks, by: missKim.name)

