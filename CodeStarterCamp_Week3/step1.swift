//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by 한서영 on 2022/07/06.
//

import Foundation

enum Coffee: String {
    case latte, mocha, coldBrew, espresso, americano, cappuccino
}

class Person {
    enum Gender {
        case woman, man
    }
    
    var name: String
    var age: Int
    var money: Int
    var nationality: String
    var gender: Person.Gender
    
    init(name: String, age: Int, money: Int, nationality: String, gender: Person.Gender) {
        self.name = name
        self.age = age
        self.money = money
        self.nationality = nationality
        self.gender = gender
    }
    
    func buyCoffee(coffeePrice: Int) {
        self.money -= coffeePrice
        print("\(coffeePrice)원 커피를 구매하였습니다.\n 잔액은 \(self.money)입니다.")
    }
}
