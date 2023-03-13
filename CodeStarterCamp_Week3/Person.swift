//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by tom on 2023/03/08.
//

import Foundation

struct Person {
    let name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buyCoffee(coffeeShop: CoffeeShop, coffee: Coffee) {
        print("\(name)은 가지고 있는 \(money)원으로 \(coffeeShop.name)에서 \(coffeeShop.barista.name)가 만들어주는 \(coffee)를 커피를 주문했다")
    }
    
    ///커피 주문
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        if let price = coffeeShop.menu[coffee] {
            let finalMoney = abs(money - price)

            if money >= price {
                print("\(name)이 가진돈은 \(money)원이며 커피를 주문 후 남은돈\(finalMoney)원 입니다.")
                coffeeShop.make(coffee.self, for: name)
                coffeeShop.coffeeOnPickUpTable(name)
            } else {
                print("\(name)의 잔액이 \(finalMoney)원만큼 부족 합니다")
                return
            }
        } else {
            coffeeShop.make(coffee.self, for: name)
            coffeeShop.coffeeOnPickUpTable(name)
            return
        }
    }
}
