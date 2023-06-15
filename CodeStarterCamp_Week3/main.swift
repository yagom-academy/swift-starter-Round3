//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var money: Int
    func buyCoffee (){
        var buyingCoffee: String
    }
    
    init(money: Int) {
        self.money = money
    }
}


class CoffeeShop {
    var revenue: Int
    var menu: [String: Int]
    var pickUpTable: [Int]
    func orderAndMakeCoffee() {

    }
    func onPickUpTable() {
        
    }
    
    init(revenue: Int, menu: [String: Int], pickUpTable: [Int]) {
        self.revenue = revenue
        self.menu = menu
        self.pickUpTable = pickUpTable
    }
}

enum Coffee {
    case superCoffe
    case megaCoffe
    case umCoffee
    case realCoffee
}

var misterLee = Person(money: 1000)
var missKim = Person(money: 2000)
var yagombucks = CoffeeShop(revenue: 10000, menu: [SuperCoffe: 1000], pickUpTable: 1, barista: misterLee)
