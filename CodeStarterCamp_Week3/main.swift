//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//step2

enum Coffee: String {
    case americano = "아메리카노"
    case latte = "라떼"
    case cappuccino = "카푸치노"
}

class Person {
    var money: Int
    var name: String
    
    init(money: Int, name: String) {
        self.money = money
        self.name = name
    }
    
    func order(_ coffee: Coffee, coffeeShop: CoffeeShop) {
        guard let price = coffeeShop.menu[coffee] else {
            print("상품이 존재하지 않습니다.")
            return
        }
        if money >= price {
            coffeeShop.make(coffee, name: name)
            money = money - price
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
    
    func make(_ coffee: Coffee, name: String) {
        guard let price = menu[coffee] else {
            return
        }
        sales += price
        pickUpTable.append(coffee)
        print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가 주세요.")
    }
}
var misterLee: Person = Person(money: 0, name: "misterLee")
var missKim: Person = Person(money: 4000, name: "missKim")
var yagombucks: CoffeeShop = CoffeeShop(barista: misterLee)

missKim.order(.americano, coffeeShop: yagombucks)
print(yagombucks.sales)
