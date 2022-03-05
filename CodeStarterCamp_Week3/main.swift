//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
}

struct CoffeeShop {
    var sales: Int = 0
    var barista: Person = Person(name: "", money: 0)
    var menu: Dictionary<Coffee, Int> = [.americano: 4000, .latte: 4500, .coldBrew: 5000]
    
    mutating func order(_ coffee: Coffee, by person: Person) {
        if let coffeePrice = menu[coffee] {
            if person.money >= coffeePrice {
                person.money -= coffeePrice
                sales += coffeePrice
                pickUpTable = person.name
            } else {
                print("잔액이 \((coffeePrice) - person.money)원만큼 부족합니다.")
            }
        }
    }
    
    var pickUpTable: String? {
        didSet {
            if let pickUpTable = pickUpTable {
                print("\(pickUpTable)님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
            }
        }
    }
}

enum Coffee {
    case americano
    case latte
    case coldBrew
}

var misterLee: Person = Person(name: "misterLee", money: 0)
var missKim: Person = Person(name: "missKim", money: 10000)
var yagombucks: CoffeeShop = CoffeeShop(barista: misterLee)

yagombucks.order(.americano, by: missKim)
