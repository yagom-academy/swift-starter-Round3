//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation



var misterLee: Person = Person(name: "Mr.Lee", money: 0)
var missKim: Person = Person(name: "Miss.Kim", money: 10000)
var yagombucks: CoffeeShop = CoffeeShop(name: "YAGOMBUCKS", dailyTotal: 0, barista: misterLee)


missKim.buyCoffee(coffee: .americano, cafe: yagombucks)
missKim.buyCoffee(coffee: .americano, cafe: yagombucks)
missKim.buyCoffee(coffee: .americano, cafe: yagombucks)
