//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee: Double {
    case americano = 3000, lattee = 3500, hazelnuts = 4000
}

struct Person {
    var name: String
    var money: Double
    
    
    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        if money >= coffee.rawValue {
            money -= coffee.rawValue
            coffeeShop.make(coffee, from: name)
        } else {
            print("잔액이 \(coffee.rawValue - money)원만큼 부족합니다.")
        }
    }
}

class CoffeeShop {
    var pickUpTable = [Coffee]()
    
    func make(_ coffee: Coffee, from name: String) {
        pickUpTable.append(coffee)
        print("\(name) 님이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

var yagombucks = CoffeeShop()
var missKim = Person(name: "missKim", money: 3500)

missKim.order(.lattee, of: yagombucks, by: "missKim")
