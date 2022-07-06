//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var money: Int
    
    func buyCoffee() {
        
    }
}

struct CoffeeShop {
    var sales: Int
    var coffeePrice: Dictionary<Coffee, Int> = [Coffee: Int]()
    var pickUpTable: Array<Coffee> = [Coffee]()
    var barista: Person
    
    func takeOrder() {
        
    }
    func makeCoffee() {
        
    }
    func toPickUpTable() {
        
    }
    
}


enum Coffee {
    case americano, latte, cappuccino
}

var misterLee = Person(money: 100)
var missKim = Person(money: 150)

var yagombucks = CoffeeShop(sales: 10000, coffeePrice: [:], pickUpTable: [], barista: misterLee)
