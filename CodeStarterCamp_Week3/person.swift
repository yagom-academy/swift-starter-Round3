//
//  person.swift
//  CodeStarterCamp_Week3
//
//  Created by CHYUN on 3/1/24.
//

import Foundation

class Person {
    var nickName: String
    var money: Int
    var myCoffee: Coffee? = nil
    
    init(nickName: String, money: Int) {
        self.nickName = nickName
        self.money = money
    }

    func orderCoffee(coffee: Coffee) -> Coffee {
        return coffee
    }

    func payPrice(price: Int) -> Int {
        var pay = 0
        if money >= price {
            money -= price
            pay = price
        } else {
            pay = money
        }
        return pay
    }

    func takeMyCoffee(coffee: Coffee) {
        myCoffee = coffee
    }
    
}
