//
//  structForPerson.swift
//  CodeStarterCamp_Week3
//
//  Created by 정주호 on 08/03/2022.
//

import Foundation

class Person {
    var name: String
    var age: Int
    var money: Int

    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    func order(coffee: Coffee) {
        print("\(coffee)주세요")
        if money < Coffee. {
            print("잔액이 \(coffee.hashValue)원 만큼 부족합니다.")
        }
    }
}
