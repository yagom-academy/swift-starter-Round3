//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    let gender: String
    var age: Int
    var money: Int
    
    func orderCoffee(_ coffee: Coffee) {
        print("\(coffee.rawValue)로 주문하겠습니다.")
    }
}

struct CoffeeShop {
    var cafeName: String
    var barista: Person
    var menu: [Coffee: Int] = [:]
    var pickUpTable: [Coffee] = []
    var sales: Int?
    
    mutating func takeOrderAndMake(_ coffee: Coffee) {
        if let price = menu[coffee] {
            print("\(coffee.rawValue) \(price)원 결제 도와드리겠습니다.")
            pickUpTable.append(coffee)
            print("주문하신 \(coffee.rawValue) 나왔습니다.")
        }
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case cafeLatte = "카페라테"
    case cafeMocha = "카페모카"
    case grapefruitAde = "자몽에이드"
    case chamomileTea = "카모마일티"
}

var misterLee: Person = Person(name: "misterLee", gender: "male", age: 26, money: 20000)
var missKim: Person = Person(name: "missKim", gender: "female", age: 25, money: 50000)
var yagombucks: CoffeeShop = CoffeeShop(cafeName: "yagombucks", barista: misterLee, menu: [.americano: 4000, .cafeLatte: 4500, .cafeMocha: 5000, .grapefruitAde: 5500, .chamomileTea: 5500])

missKim.orderCoffee(.cafeMocha)
yagombucks.takeOrderAndMake(.cafeMocha)
