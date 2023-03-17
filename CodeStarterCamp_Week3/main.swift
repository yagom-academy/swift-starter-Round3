//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var money: Int = 0
    
    func buyCoffee() {
        print("커피를 주문합니다.")
    }
}

struct CoffeeShop {
    var sales: Int = 0
    var barista: Person
    var menu: [String: Int] = ["americano": 2000, "latte": 2500, "mocha": 3000, "espresso": 1500]
    var pickUpTable: [String] = []
    
    mutating func orderCoffee() {
        print("커피를 주문받습니다")
        let coffee = readLine()!
        print("커피를 만듭니다")
        pickUpTable.append(coffee)
        
    }
}

enum Coffee {
    case americno, latte, mocha, espresso
}

var misterLee: Person = Person()
misterLee.money = 10000
misterLee.buyCoffee()

var missKim: Person = Person()
missKim.money = 20000
missKim.buyCoffee()

var yagombucks: CoffeeShop = CoffeeShop(barista: misterLee)
yagombucks.sales = 10000000
print(yagombucks.menu)
yagombucks.orderCoffee()
print(yagombucks.pickUpTable)

