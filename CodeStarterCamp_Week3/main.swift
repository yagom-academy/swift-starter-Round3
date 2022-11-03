//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let misterLee = Person(name: "Mr.Lee", gender: "male", money: 10000)
let missKim = Person(name: "Miss.Kim", gender: "female", money: 1000000)

let coffeeMenu: [Coffee: Int] = [
    .espresso : 500,
    .americano: 1000,
    .iceAmericano: 1500,
    .cafeLatte: 2000,
    .iceCafeLatte: 2000,
    .vanillaLatte: 2500,
    .iceVanillaLatte: 3000
]

var yagombucks = CoffeeShop(menu: coffeeMenu, barista: misterLee)

yagombucks.orderCoffee(coffee: .iceVanillaLatte)
missKim.buyCoffee(coffee: .iceVanillaLatte, price: 1000)
