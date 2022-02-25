//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var name: String = ""
    var money: Int = 0
    
    func buySome(coffee: Coffee) {
        print("\(coffee)주세요.")
    }
}

struct CoffeeShop {
    var sales: Int = 0
    var barista: Person = Person()
    var menu: Dictionary<Coffee, Int> = [:]
    
    func makeCoffee(order: Coffee) {
        print("\(order)만드는중")
    }
    
    func pickUpTable(coffee: Coffee) {
        print("\(coffee)나왔습니다.")
    }
}

enum Coffee {
    case americano
    case latte
    case coldBrew
}

var misterLee: Person = Person(name: "misterLee", money: 10000)
var missKim: Person = Person(name: "missKim", money: 10000)
var yagombucks: CoffeeShop = CoffeeShop(barista: misterLee)
