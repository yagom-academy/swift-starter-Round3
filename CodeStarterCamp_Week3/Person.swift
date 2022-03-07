//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by NAMU on 2022/03/07.
//

import Foundation

class Person {
    var money: Int
    var name:  String
    
    init(money: Int, name: String) {
        self.money = money
        self.name = name
    }
    
    func purchase(_ payment :Int) {
        self.money = money - payment
    }
}
