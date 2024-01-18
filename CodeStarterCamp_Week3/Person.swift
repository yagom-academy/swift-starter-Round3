//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 맨태 on 1/9/24.
//

import Foundation

final class Person {
    private(set) var fullName: String
    private var weight: Int
    private var height: Int
    private(set) var nationality: String
    private(set) var mbti: String
    private var money: Int
    
    init(fullName: String, weight: Int, height: Int, nationality: String, mbti: String, money: Int) {
        self.fullName = fullName
        self.weight = weight
        self.height = height
        self.nationality = nationality
        self.mbti = mbti
        self.money = money
    }
    
    func visitCoffeeShop(to coffeeShop: CoffeeShop) {
        print("\(self.fullName)은 \(coffeeShop.storeName)을 방문합니다.")
    }
    
    func orderCoffee(to coffeeShop: CoffeeShop, orderList: [Coffee]) {
        coffeeShop.acceptOrder(from: self, orderList: orderList)
    }
    
    func takeCoffee(to coffeeShop: CoffeeShop) {
        guard let coffees = coffeeShop.giveCoffee(from: self) else {
            print("\(self.fullName)님의 완료된 주문이 없습니다. 주문을 확인해 주세요.")
            return
        }
        
        print("\(self.fullName)은 커피를 받아서 맛있게 먹었습니다.")
        print("---주문내역---")
        coffees.forEach({ print($0.name) })
    }
}
