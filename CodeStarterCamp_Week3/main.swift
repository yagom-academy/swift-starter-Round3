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
    
    func buyCoffee() {
        print("커피를 구매하였습니다.")
    }
    
    init(money: Int) {
        self.money = money
    }
}

class CoffeeShop {
    var sales: Int
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee]
    var barista: Person
    
    func order(_ coffee: Coffee) {
        make(coffee)
    }
    
    func make(_ coffee: Coffee) {
        pickUpTable.append(coffee)
    }
    
    init(sales: Int, menu: [Coffee : Int], pickUpTable: [Coffee], barista: Person) {
        self.sales = sales
        self.menu = menu
        self.pickUpTable = pickUpTable
        self.barista = barista
    }
}

enum Coffee {
    case americano, cappuccino, espresso, latte, mocha, greenTea, iceTea
}

let misterLee: Person = Person(money: 0)
let missKim: Person = Person(money: 12000)
let yagombucksMenu: [Coffee: Int] = [.americano: 4500, .cappuccino: 5500, .espresso: 4000, .mocha: 5500, .latte: 5000, .greenTea: 6500, .iceTea: 5000]
let yagombucks: CoffeeShop = CoffeeShop(sales: 0,
                                        menu: yagombucksMenu,
                                        pickUpTable: [],
                                        barista: misterLee)


