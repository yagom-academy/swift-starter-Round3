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
    
    func checkPrice(_ coffee: Coffee, of coffeeShop: CoffeeShop) -> Int {
        if let coffeePrice = coffeeShop.menu[coffee] {
            return coffeePrice
        } else {
            print("존재하지 않는 메뉴입니다.")
            return 0
        }
    }
    
    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        let coffeePrice = checkPrice(coffee, of: coffeeShop)
        
        if money < coffeePrice {
            print("잔액이 \(coffeePrice - money)원만큼 부족합니다.")
        } else {
            money -= coffeePrice
            coffeeShop.make(coffee, for: name)
        }
    }
}
