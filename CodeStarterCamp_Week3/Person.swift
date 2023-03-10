//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by eve on 2023/03/10.
//

import Foundation

struct Person {
    let name: String
    var money: Int = 0
    
    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        guard let price = coffeeShop.menu[coffee] else {
            print("주문할 수 없습니다.\n")
            return
        }
        
        if checkMoney(with: price) {
            coffeeShop.make(coffee, from: name)
        }
    }
    
    mutating func checkMoney(with price: Int) -> Bool {
        if money >= price {
            pay(the: price)
            return true
        } else {
            print("잔액이 \(price - money)원만큼 부족합니다.\n")
            return false
        }
    }
    
    mutating func pay(the price: Int) {
        money -= price
        print("\(name)의 잔액: \(money)원\n")
    }
}
