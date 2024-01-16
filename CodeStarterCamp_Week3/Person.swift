//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 맨태 on 1/9/24.
//

import Foundation

final class Person {
    private var fullName: String
    private var weight: Int
    private var height: Int
    private var nationality: String
    private var mbti: String
    private var money: Int
    
    init(fullName: String, weight: Int, height: Int, nationality: String, mbti: String, money: Int) {
        self.fullName = fullName
        self.weight = weight
        self.height = height
        self.nationality = nationality
        self.mbti = mbti
        self.money = money
    }
    
    func name() -> String {
        return self.fullName
    }
    
    func visitCoffeeShop(coffeeShop: CoffeeShop) {
        print("\(self.fullName)은 \(coffeeShop.name())을 방문합니다.")
    }
    
    func orderCoffee(to coffeeShop: CoffeeShop, orderList: [Coffee]) {
        coffeeShop.acceptOrder(from: self, orderList: orderList)
    }
    
    func takeCoffee(to coffeeShop: CoffeeShop) {
        guard let coffees = coffeeShop.giveCoffee(from: self) else { return }
        
        print("\(self.fullName)은 커피를 받아서 맛있게 먹었습니다.")
        coffees.forEach({ print($0.rawValue) })
    }
}
