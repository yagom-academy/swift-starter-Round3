//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 이정민 on 2022/04/26.
//

class Person {
    private(set) var name: String
    var height: Double
    var weight: Double
    private(set) var money: Int
    
    init(name: String, height: Double, weight: Double, money: Int) {
        self.name = name
        self.height = height
        self.weight = weight
        self.money = money
    }
    
    func buy(coffee: Coffee, at shop: CoffeeShop) {
        shop.order(coffee, for: self)
    }
    
    func pay(money: Int){
        self.money -= money
    }
}
