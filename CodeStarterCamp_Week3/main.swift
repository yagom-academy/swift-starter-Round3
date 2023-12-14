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
        print("커피를 구매합니다.")
    }
}

struct CoffeeShop {
    var sales: Int
    var menu: [String: Int]
    var pickUpTable: [Coffee]
    var barista: Person
    
    init(barista: Person) {
        self.sales = 0
        self.menu = ["americano": 2900, "latte": 3900, "cappuccino": 3900, "mocha": 4200, "macchiato": 4900]
        self.pickUpTable = [Coffee.americano, Coffee.latte, Coffee.cappuccino, Coffee.mocha, Coffee.macchiato]
        self.barista = barista
    }
    
    func takeOrder() {
        print("주문을 받습니다.")
    }
    
    func makeCoffee() {
        print("커피를 만듭니다.")
        
        putCoffee()
    }
    
    func putCoffee() {
        print("커피를 서빙합니다.")
//        pickUpTable.append(<#T##newElement: Coffee##Coffee#>)
    }
}

enum Coffee {
    case americano
    case latte
    case cappuccino
    case mocha
    case macchiato
}

//var misterLee = Person(money: 30000)
var misterLee = Person()
var missKim = Person(money: 50000)

var yagombucks = CoffeeShop(barista: misterLee)
