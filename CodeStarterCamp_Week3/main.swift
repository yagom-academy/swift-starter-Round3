//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


let missKim: Person = Person(name: "missKim", money: 5000)
let misterLee: Barista = Barista(name: "misterLEe", money: 2000)

let coffeeMenu = CoffeeMenu(coffeeList: [.americano: 3000, .espresso: 1000, .caffeelatte: 4000, .deCaffeine: 4000])
let coffeeShop: CoffeeShop = CoffeeShop(coffeeMenu: coffeeMenu)

coffeeShop.hireBarista(barista: misterLee)

missKim.orderCoffee(coffee: .americano, coffeeShop: coffeeShop)


