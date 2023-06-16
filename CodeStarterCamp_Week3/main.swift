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
        
    }
    
    init(money: Int) {
        self.money = money
    }
}

class CoffeeShop {
    var revenue: Int
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee]
    var barista: Person
    func ordered() {

    }
    func makeCoffe() {
        
    }
    func dropOnPickUpTable() {
        
    }
    
    init(revenue: Int, menu: [Coffee: Int], pickUpTable: [Coffee]) {
        self.revenue = revenue
        self.pickUpTable = pickUpTable
        self.menu = menu
        self.barista = misterLee
    }
}

enum Coffee: String {
    case superCoffe
    case megaCoffe
    case umCoffee
    case realCoffee
}

var misterLee = Person(money: 1000)
var missKim = Person(money: 2000)
var yagombucks = CoffeeShop(revenue: 10000, menu: [.superCoffe: 4000, .megaCoffe: 3000, .umCoffee: 2000, .realCoffee: 1000], pickUpTable: [.megaCoffe])
