//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 정선아 on 2022/04/27.
//

import Foundation

struct Person {
    var name: String
    var age: Int
    var habit: String?
    var personalMBTI: String?
    var walletInCash: Int
    init(name: String, age: Int, habit: String? = nil, personalMBTI: String? = nil, walletInCash: Int) {
        self.name = name
        self.age = age
        self.habit = habit
        self.personalMBTI = personalMBTI
        self.walletInCash = walletInCash
    }
    func buyCoffee(_ coffee: Coffee) {
        print("\(name)이 \(coffee)를 삽니다.")
        print("\(name)에게 \(walletInCash)원이 남았어요")
    }
}
