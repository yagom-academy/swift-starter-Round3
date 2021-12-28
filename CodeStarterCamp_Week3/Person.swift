//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by hyogang on 2021/12/28.
//

import Foundation

class Person {
    var money: Int = 0
    var purchasedItem: Array<String>?
    
    func purchaseSomething(price: Int, item: String) {
        money -= price
        purchasedItem?.append(item)
    }
}
