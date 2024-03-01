//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by Jay Shin on 3/1/24.
//

struct Person {
    let name: String
    var money: Int
    
    func buyCoffee(coffee: Coffee) {
        print("\(name)이(가) \(coffee.rawValue)를 주문합니다.")
    }
}
