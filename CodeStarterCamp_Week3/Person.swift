//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 정선아 on 2022/04/27.
//

import Foundation

class Person {
    let name: String
    let age: Int
    var habit: String?
    var MBTI: String?
    var walletInCash: Int
    
    init(name: String, age: Int, habit: String? = nil, MBTI: String? = nil, walletInCash: Int) {
        self.name = name
        self.age = age
        self.habit = habit
        self.MBTI = MBTI
        self.walletInCash = walletInCash
    }
    
    func spandCash(amount: Int) {
        if isPayable(amount) == false {
            print("잔돈이 부족합니다.")
        } else {
            walletInCash -= amount
        }
    }
    
    func isPayable(_ amount: Int) -> Bool {
        return walletInCash >= amount
    }
    
    func buyCoffee(_ coffee: Coffee, at coffeeShop: CoffeeShop) {
        guard let price = coffeeShop.menu[coffee] else {
            print("주문한 커피가 메뉴에 없습니다.")
        }
        if isPayable(price) {
            walletInCash -= price
            coffeeShop.order(coffee, price: price, customerName: name)
        } else {
            print("\(coffee) 를 주문하기엔 잔액이 \(price - walletInCash)원 부족합니다.")
        }
    }
}

