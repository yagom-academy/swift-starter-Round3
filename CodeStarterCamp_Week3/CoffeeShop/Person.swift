//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 조민호 on 2021/12/20.
//

import Foundation

class Person {
    let age: Int
    let name: String
    private(set) var money: Int
    
    init(age: Int, name: String, money: Int) {
        self.age = age
        self.name = name
        self.money = money
    }
    
    func buy(coffee: Coffee) {
        self.money -= coffee.price
    }
}
