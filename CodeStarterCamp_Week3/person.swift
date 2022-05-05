//
//  person.swift
//  CodeStarterCamp_Week3
//
//  Created by 수염 on 2022/05/05.
//

import Foundation

struct Person {
    var name: String
    var money: Int
    var job: String
    
    init(name: String, money: Int, job: String) {
        self.name = name
        self.money = money
        self.job = job
        }
    
    func buyCoffee() { }
    func work() { }
}
