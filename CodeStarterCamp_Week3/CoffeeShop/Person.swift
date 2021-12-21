//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 조민호 on 2021/12/20.
//

import Foundation

struct Person {
    private(set) var age: Int
    private(set) var name: String
    private(set) var money: Int
    
    mutating func buy(coffee: Coffee) {
        self.money -= coffee.price
    }
}
