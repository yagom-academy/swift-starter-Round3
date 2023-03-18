//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by Dean on 2023/03/16.
//

import Foundation

struct Person {
    let name: String
    var money: Int
    
    mutating func pay(price: Int) {
        money -= price
    }
    
    func checkMoney(_ coffee: Coffee, of coffeeShop: CoffeeShop) -> Bool {
        if let coffeePrice = coffeeShop.menu[coffee] {
            if money < coffeePrice {
                print("잔액이 \(coffeePrice - money)원만큼 부족합니다.")
                return false
            } else {
                return true
            }
        } else {
            print("존재하지 않는 메뉴입니다.")
            return false
        }
    }
    
    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        if checkMoney(coffee, of: coffeeShop),
           let coffeePrice = coffeeShop.menu[coffee] {
            pay(price: coffeePrice)
            coffeeShop.make(coffee, for: name)
        }
    }
}
