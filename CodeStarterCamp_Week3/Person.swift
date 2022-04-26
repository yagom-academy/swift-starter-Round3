//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 이정민 on 2022/04/26.
//

struct Person {
    var name: String
    var height: Double
    var weight: Double
    var money: Int
    
    init(name: String, height: Double, weight: Double, money: Int) {
        self.name = name
        self.height = height
        self.weight = weight
        self.money = money
    }
    
    func buyCoffee(type coffee: Coffee) {
        print("\(coffee.rawValue)를 구매합니다")
    }
}
