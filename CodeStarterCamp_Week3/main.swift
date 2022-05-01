//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


let missKim: Customoer = Customoer(name: "missKim", money: 5000)
let misterLee: Barista = Barista(name: "misterLEe", money: 2000)

let coffeeShop: CoffeeShop = CoffeeShop()

coffeeShop.hireBarista(barista: misterLee)

missKim.orderCoffee(coffee: .americano, coffeeShop: coffeeShop)


