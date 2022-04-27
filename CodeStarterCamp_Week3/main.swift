//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// MARK: - STEP1

class Person {
    var name: String = ""
    var defaultBuget: Int = 0
    
    func buyDrink(at coffeeShop: CoffeeShop, which menuName: String){
        guard let menu = coffeeShop.menuList[menuName] else { return }

        switch menu {
        case .americano(let price):
            self.defaultBuget -= price
        case .einspanner(let price):
            self.defaultBuget -= price
        case .vanillaLatte(let price):
            self.defaultBuget -= price
        case .latte(let price):
            self.defaultBuget -= price
        }
    }
    
    init(name: String) {
        self.name = name
    }
}

enum Coffee {
    case americano(price: Int)
    case latte(price: Int)
    case vanillaLatte(price: Int)
    case einspanner(price: Int)
}

class CoffeeShop {
    var revenue: Int = 0
    var barista: Person?
    var pickUpTable: Array<String?> = []
    var menuList: Dictionary<String, Coffee> = [
        "Americano": .americano(price: 3500) ,
        "Einspanner": .einspanner(price: 5500),
        "Latte": .latte(price: 4000),
        "Vanilla Latte" : .vanillaLatte(price: 4500)
    ]

    func order(_ coffee: Coffee) { }
    
    func makeCoffee() { }
}

// MARK: - 실행부

let misterLee: Person = Person(name: "이미남")
let missKim: Person = Person(name: "김미녀")
missKim.defaultBuget = 100000

let yagombucks: CoffeeShop = CoffeeShop()
yagombucks.barista = misterLee
