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
    
    func buyCoffee(_ coffee: Coffee, by coffeeShop: CoffeeShop) {
        self.money = coffeeShop.orderCoffee(coffee, from: self)
    }
}

enum Coffee {
    case espresso, americano, latte, decaffeinatedAmericano
}

class CoffeeShop {
    var menu: Dictionary<Coffee, Int> = Dictionary<Coffee, Int>()
    var revenue: Int = 0
    var pickUpTable: Array<Coffee> = Array<Coffee>()
    var barista: Person?
    
    func orderCoffee(_ coffee: Coffee, from customer: Person) -> Int {
        if let coffeePrice = self.menu[coffee] {
            if coffeePrice > customer.money {
                print("잔액이 부족합니다")
                return customer.money
            }
            self.makeCoffee(coffee)
            self.revenue += coffeePrice
            return customer.money - coffeePrice
        } else {
            print("주문하신 메뉴가 존재하지 않습니다.")
            return customer.money
        }
    }
    
    func makeCoffee(_ coffee: Coffee) {
        self.pickUpTable.append(coffee)
        print("음료가 준비되었습니다")
    }
}

var yagombucks = CoffeeShop()
var misterLee = Person()

yagombucks.barista = misterLee


