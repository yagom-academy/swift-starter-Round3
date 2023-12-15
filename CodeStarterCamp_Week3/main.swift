//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var money: Int = 0
    
    mutating func buyCoffee(price: Int) {
        if money >= price {
            money -= price
            print("커피를 주문하였습니다.")
        } else {
            let shortage = price - money
            print("잔액이 \(shortage)원만큼 부족합니다.")
        }
    }
}

class CoffeeShop{
    var sales: Int = 0
    var menu: [Coffee: Int]
    var pickUpTable = [Coffee]()
    var barista: Person
    
    init(barista: Person, menu:[Coffee: Int]){
        self.barista = barista
        self.menu = menu
    }
    func takeCoffee(type: Coffee){
        if let price = menu[type] {
            barista.buyCoffee(price: price)
            pickUpTable.append(type)
            print("\(type) 주문이 들어왔습니다. 제조를 시작합니다.")
        }
    }
}

enum Coffee{
    case espresso
    case latte
    case ade
    case water
}
let coffeeMenu: [Coffee: Int] = [
    .espresso: 2500,
    .latte: 3500,
    .ade: 5000,
    .water: 500
]

var misterLee: Person = Person()
var missKim: Person = Person()

var yagombucks: CoffeeShop = CoffeeShop(barista: misterLee, menu: coffeeMenu)
