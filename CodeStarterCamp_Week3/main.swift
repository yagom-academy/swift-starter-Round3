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
    
    init(money: Int) {
        self.money = money
    }
    
    func order(coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        coffeeShop.make(coffee: coffee, for: name)
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
    
    func make(coffee: Coffee, for name: String) {
        pickUpTable.append(coffee)
    }
}

enum Coffee: String {
    case espresso = "에스프레소"
    case americano = "아메리카노"
    case cafeLatte = "카페라떼"
    case vanillaLatte = "바닐라 라떼"
    case cappuccino = "카푸치노"
    case einspanner = "아인슈페너"
}

let misterLee: Person = Person(money: 20000)
let missKim: Person = Person(money: 30000)
var yagombucks: CoffeeShop = CoffeeShop(sales: 0, menu: [.espresso: 2000, .americano: 3000, .cafeLatte: 4000, .einspanner: 5000], pickUpTable: [])
yagombucks.barista = misterLee
