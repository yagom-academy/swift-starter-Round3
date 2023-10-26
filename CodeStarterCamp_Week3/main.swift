//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//print("Hello, World!")

let misterLee = Person(money: 10000, name: "misterLee")
let missKim = Person(money: 3500, name: "missKim")

let yagombucks = CoffeeShop(barista: misterLee)
yagombucks.menuPan = [.americano: 3900, .vanillaLatte: 4500, .iceAmericano: 4300, .cafeLatte: 4400]

misterLee.order(.americano, at: yagombucks)
missKim.order(.cafeLatte, at: yagombucks)
