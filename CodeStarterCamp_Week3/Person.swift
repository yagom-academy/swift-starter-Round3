//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by hyogang on 2021/12/28.
//

import Foundation

class Person {
    var name: String
    var money: Int
    var purchasedItem = [String]()
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func purchaseSomething(price: Int, item: String) {
        money -= price
        purchasedItem.append(item)
    }
}
