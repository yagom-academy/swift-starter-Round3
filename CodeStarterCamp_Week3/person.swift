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
    var moneyToPay = 0
    var myCoffee: Coffee? = nil
    
    init(nickName: String, money: Int) {
        self.nickName = nickName
        self.money = money
    }

    func orderCoffee(coffee: Coffee) -> Coffee {
        return coffee
    }
    
    func canIPay(price: Int) -> Bool {
        moneyToPay = price
        return money >= price
    }

    func payPrice(possible: Bool) -> Int {
        if (possible) { money -= moneyToPay }
        return possible ? moneyToPay : 0
    }

    func takeMyCoffee(coffee: Coffee) {
        myCoffee = coffee
    }
    
}
