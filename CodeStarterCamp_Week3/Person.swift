//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 홍승주 on 2022/04/28.
//

import Foundation

class Person {
    let name: String
    let age: Int
    var money: Int
   
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }

    func introduce() {
        print("안녕하세요 저는\(self.name)입니다. 저는 \(self.age)살 입니다.")
    }
    func buyCoffee(_ coffee: Coffee, _ coffeeShop: CoffeeShop) {
        print("\(coffee) 주세요")
        coffeeShop.getOrder(coffee, self)
    }
}

