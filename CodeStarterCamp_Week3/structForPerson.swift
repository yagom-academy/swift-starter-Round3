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
    
    func order(coffee: Coffee, coffeeShop: CoffeeShop, customerName: Person) {
        print("\(coffee)주세요")
        if self.money < coffee.price {
            print("잔액이 \(coffee.price - self.money)만큼 부족합니다.")
        } else {
            coffeeShop.takeOrder(coffee: coffee, customerName: customerName)
            self.money -= coffee.price
        }
    }
}
