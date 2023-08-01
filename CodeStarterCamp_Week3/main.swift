//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//step1

enum Coffee {
    case 아메리카노
    case 라떼
    case 카푸치노
}

class Person {
    var money: Int?
    
    func order() {
        print("order coffee")
    }
}

class CoffeeShop {
    var sales: Int?
    var menu: [String : Int] = [:]
    var pickUpTable: [Coffee] = []
    var barista: Person
    
    init(barist: Person) {
        self.barista = barist
    }
    
    func make(_ coffee: Coffee) {
        pickUpTable.append(coffee)
    }
}

var misterLee: Person = Person()
var missKim: Person = Person()
var yagombucks: CoffeeShop = CoffeeShop(barist: misterLee)
