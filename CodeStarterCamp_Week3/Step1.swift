//
//  Step1.swift
//  CodeStarterCamp_Week3
//
//  Created by 홍성준 on 2023/08/02.
//

import Foundation

class Person {
    var name: String
    var asset: Int = 0
    init(name: String, asset: Int) {
        self.name = name
        self.asset = asset
    }
    
    func buyCoffee(coffeeShop: CoffeeShop, menus: [Coffee]) {
        coffeeShop.getOrder(menus: menus)
        for menu in menus {
            if let price = coffeeShop.menus[menu.rawValue] {
                self.asset -= price
            }
        }
    }
    
}

class CoffeeShop {
    var barista: Person?
    var sales: Int = 0
    var menus: Dictionary<String, Int> = [:]
    var pickUpTable: Array<String> = []
    init() {
        self.menus = [Coffee.americano.rawValue: 4000,
                      Coffee.latte.rawValue: 4500,
                      Coffee.iceTea.rawValue: 5000]
    }
    func getOrder(menus: [Coffee]) {
        for menu in menus {
            self.makeCoffee(menu.rawValue)
        }
    }
    
    func makeCoffee(_ menu: String) {
        self.pickUpTable.append(menu)
        if let sale = menus[menu] {
            self.sales += sale
        }
    }
}

enum Coffee: String {
    case americano = "americano"
    case latte = "latte"
    case iceTea = "iceTea"
}
