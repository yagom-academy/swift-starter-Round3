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
let missKim = Person(money: 10000, name: "missKim")

let yagombucks = CoffeeShop()
yagombucks.barista = misterLee

misterLee.buyCoffee(coffeeShop: yagombucks, coffee: Coffee.americano)

for coffee in yagombucks.pickUpTable {
    print(coffee.name)
}

