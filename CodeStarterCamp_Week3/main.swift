//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

//import Foundation

struct Person {
    var money: Int = 0
    
    func buyCoffee() {
        print("커피를 구매합니다.")
    }
}

struct CoffeeShop {
    var revenue: Double = 0
    var menu: Dictionary<Coffee,Double> = [:]
    var pickUpTable: Array<Coffee> = []
    var baristar: Person = Person()

    func takeOrder() {
        print("주문을 받습니다.")
    }
    
    mutating func makeCoffee(orderedCoffee: Coffee) {
        print("커피를 만듭니다.")
        pickUpTable.append(orderedCoffee)
    }
        
}

enum Coffee {
    case Espresso, Americano, Latte
}

var misterLee: Person = Person()
var missKim: Person = Person()

var yagombucks: CoffeeShop = CoffeeShop(baristar: misterLee)
