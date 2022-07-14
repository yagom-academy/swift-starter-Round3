//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var haveMoney: Int
    
    func buyCoffee(orderedCoffee: Coffee) {
        print("\(orderedCoffee)주문할게요!")
    }
}
struct CoffeeShop {
    var sales: Int
    
    var coffeeMenu: Dictionary<Coffee, Int> = [Coffee: Int]()
    
    var pickUPTable: [Coffee] = []
    
    mutating func takeOrderAndBrewCoffee(coffee: Coffee ) {
        print("\(coffee)커피 주문받았습니다!")
        print("\(coffee)커피 나왔습니다!")
        pickUPTable.append(coffee)
    }
    var barista: Person
    
    
}
enum Coffee {
    case americano, latte, macchiato, affocato, vanillaLatte
}

var misterLee = Person(haveMoney: 10000)
misterLee.buyCoffee(orderedCoffee: Coffee.americano)
var missKim = Person(haveMoney: 10000)
missKim.buyCoffee(orderedCoffee: Coffee.latte)
var yagombucks = CoffeeShop(sales: 0, barista: misterLee)
yagombucks.takeOrderAndBrewCoffee(coffee: Coffee.affocato)
yagombucks.takeOrderAndBrewCoffee(coffee: Coffee.latte)
