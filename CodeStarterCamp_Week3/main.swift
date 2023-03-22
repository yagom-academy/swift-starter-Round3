//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
import Foundation

let misterLee = Person(name: "misterLee", money: 100000)
let missKim = Person(name: "missKim", money: 200000)

let yagombucks = CoffeeShop(name: "yagombucks", menu: [.americano : 4000, .caffeMocha : 5000], barista: [misterLee])

missKim.orderCoffee(.americano, from: yagombucks)
missKim.pickUpCoffee(from: yagombucks)
