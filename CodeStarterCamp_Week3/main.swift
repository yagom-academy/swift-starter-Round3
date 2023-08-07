//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var money: Int = 0
    
    func buyCoffee() {
        
    }
}

class CoffeeShop {
    var sales: Int = 0
    var menu: [String: Int] = [:]
    var pickUpTable: [String] = []
    var barista: Person?
    
    enum Coffee: String {
        case espresso, americano, cafeLatte, vanilaLatte, cafeMoca
    }
    
    func getOrder(orderedCoffee: String) {
        print("\(orderedCoffee)를 주문 받았다.")
        let brewedCoffee: String = brewCoffee(to: orderedCoffee)
        pickUpTable.append(brewedCoffee)
    }
    
    func brewCoffee(to orderedCoffee: String) -> String {
        let brewedCoffee: String = "완성된 \(orderedCoffee)"
        return brewedCoffee
    }
}

var misterLee: Person = Person()
var yagombucks: CoffeeShop = CoffeeShop()
yagombucks.barista = misterLee

