//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let missKim = Person(name: "Miss.Kim", gender: "female", money: 10000)
let misterLee = Person(name: "Mister.Lee", gender: "male", money: 10000)
let coffeeMenu: [Coffee: Int] = [
    .espresso : 500,
    .americano: 2000,
    .iceAmericano: 2500,
    .cafeLatte: 2500,
    .iceCafeLatte: 3000,
    .vanillaLatte: 4000,
    .iceVanillaLatte: 4500
]

var yagombucks = CoffeeShop(menu: coffeeMenu, barista: misterLee)

missKim.order(coffee: .cafeMocha, coffeeShop: yagombucks)
yagombucks.printTotalSales()

missKim.order(coffee: .iceVanillaLatte, coffeeShop: yagombucks)
yagombucks.printTotalSales()

missKim.order(coffee: .iceAmericano, coffeeShop: yagombucks)
yagombucks.printTotalSales()
 
missKim.order(coffee: .vanillaLatte, coffeeShop: yagombucks)
yagombucks.printTotalSales()
