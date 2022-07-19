//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var name: String
    var balance: Int
    
    func buyCoffee(orderedCoffee: Coffee) -> Coffee {
        return orderedCoffee
    }
}
struct CoffeeShop {
    var sales: Int
    
    var coffeeMenu: Dictionary<Coffee, Int> = [Coffee.americano : 4000, Coffee.latte : 4500, Coffee.macchiato: 5000]
    
    var pickUPTable: [Coffee] = []
    
    func takeOrder(customer: Person, coffee: Coffee ) {
        print("\(customer.name)의 \(coffee)를 주문받았습니다!")
        
    }
    mutating func brewCoffee(coffee: Coffee) {
        print("\(coffee) 커피 주문받고 내리겠습니다!")
        pickUPTable.append(coffee)
    }
    var barista: Person?
    
    
}
enum Coffee {
    case americano, latte, macchiato
    
    var price: Int {
        get {
            switch self {
            case .americano:
                return 4000
            case .latte:
                return 4500
            case .macchiato:
                return 5000
            }
        }
    }
}


var misterLee: Person = Person(name: "misterLee", balance: 10000)
var yagombucks = CoffeeShop(sales: 0)
yagombucks.takeOrder(customer: misterLee, coffee: .americano)
yagombucks.brewCoffee(coffee: Coffee.americano)
yagombucks.barista = misterLee
var misterKim: Person = Person(name: "misterKim", balance: 20000)
yagombucks.takeOrder(customer: misterKim, coffee: .latte)
yagombucks.brewCoffee(coffee: Coffee.latte)
