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
    init(money: Int) {
        self.money = money
    }
    
    func orderCoffee(menu: Coffee, coffeeShop: CoffeeShop, by name: String) {
        coffeeShop.makeCoffee(coffee: menu, for: name)
    }
}

class CoffeeShop {
    var barista: Person?
    var sales: Int
    let menu: Dictionary<Coffee, Int>
    var pickUpTable: Array<Coffee> = []
    init(sales: Int, menu: Dictionary<Coffee, Int>, pickUpTable: Array<Coffee>) {
        self.sales = sales
        self.menu = menu
        self.pickUpTable = pickUpTable
    }
    
    func makeCoffee(coffee: Coffee, for name: String) {
        pickUpTable.append(coffee)
    }
}

enum Coffee: String {
    case espresso = "에스프레소", americano = "아메리카노", cafeLatte = "카페라떼", vanillaLatte = "바닐라 라떼", cappuccino = "카푸치노", einspanner = "아인슈페너"
}

let misterLee: Person = Person(money: 20000)
let missKim: Person = Person(money: 30000)
var yagombucks: CoffeeShop = CoffeeShop(sales: 0, menu: [.espresso: 2000, .americano: 3000, .cafeLatte: 4000, .einspanner: 5000], pickUpTable: [])
yagombucks.barista = misterLee
