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
    
    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        if let coffeePrice = coffeeShop.menu[coffee] {
            if money < coffeePrice {
                print("잔액이 \(coffeePrice - money)원만큼 부족합니다.")
            } else {
                money -= coffeePrice
                coffeeShop.sales += coffeePrice
                print("결제 완료됐습니다.")
                coffeeShop.make(coffee, for: name)
            }
        } else {
            print("존재하지 않는 메뉴입니다")
        }
    }
}
