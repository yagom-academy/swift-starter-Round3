//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by Tony Lim on 2023/06/09.
//

import Foundation

class Person {
    private(set) var name: String
    private var money: Int
    private var dailyCoffee: Int
    
    init(name: String, money: Int = 0, dailyCoffee: Int = 0) {
        self.name = name
        self.money = money
        self.dailyCoffee = dailyCoffee
    }
    
    func buy(coffee: [Coffee], to shop: CoffeeShop) {
        let notEnoughMoney = "\(name)은 커피를 사먹기엔 돈이 충분치 않아요."
        
        var price = 0
        for item in coffee {
            price += shop.menu[item] ?? 0
        }
        
        let checkPrice = check(price)
        guard checkPrice else {
            print(notEnoughMoney)
            return
        }
        
        pay(price)
        shop.order(by: self, for: coffee)
    }
    
    private func check(_ money: Int) -> Bool {
        let moneyCheck = self.money - money
        return moneyCheck > 0 ? true : false
    }
    
    private func pay(_ money: Int) {
        self.money -= money
    }
    
    func take(_ coffee: [Coffee]) {
        print("\(self.name)은 \(coffee)를 가져왔습니다.")
    }
    
    func drink() {
        dailyCoffee += 1
    }
    
    func todayDrink() -> String {
        return "오늘은 \(dailyCoffee)잔의 커피를 마셨습니다."
    }
}
