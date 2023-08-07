//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//step2

enum Coffee {
    case americano
    case latte
    case cappuccino
}

class Person {
    var money: Int
    
    init(money: Int) {
        self.money = money
    }
    
    func order(_ coffee: Coffee, coffeeShop: CoffeeShop, name: String) {
        guard let price = coffeeShop.menu[coffee] else { return print("상품이 존재하지 않습니다.") }
        if money >= price {
            coffeeShop.make(coffee, barista: misterLee, name: name)
            money = money - price
            coffeeShop.sales += price
        }else {
            print("\(price - money)원만큼 잔액이 부족합니다.")
        }
    }
}

class CoffeeShop {
    var sales: Int = 0
    var menu: [Coffee : Int] = [.americano : 3000, .latte : 4000, .cappuccino : 5000]
    var pickUpTable: [Coffee] = []
    var barista: Person
    
    init(barista: Person) {
        self.barista = barista
    }
    
    func make(_ coffee: Coffee, barista: Person, name: String) {
        pickUpTable.append(coffee)
        print("\(name) 님이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가 주세요.")
    }
}

var misterLee: Person = Person(money: 0)
var missKim: Person = Person(money: 4000)
var yagombucks: CoffeeShop = CoffeeShop(barista: misterLee)

missKim.order(.americano, coffeeShop: yagombucks, name: "missKim")
print(yagombucks.sales)
