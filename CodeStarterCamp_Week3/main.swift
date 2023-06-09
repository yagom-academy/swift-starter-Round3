//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    private var money: Int
    private var dailyCoffee: Int
    
    init(money: Int = 0, dailyCoffee: Int = 0) {
        self.money = money
        self.dailyCoffee = dailyCoffee
    }
    
    func buyCoffee(pay money: Int) {
        let notEnoughMoney = "커피를 사먹기엔 돈이 충분치 않아요."
        let drinkCoffee = "커피를 한잔 사먹었습니다."
        
        let checkMoney = check(money)
        guard checkMoney else {
            print(notEnoughMoney)
            return
        }
        
        pay(for: money)
        drinkCoffee()
        
        print(drinkCoffee)
    }
    
    func check(_ money: Int) -> Bool {
        let moneyCheck = self.money - money
        return moneyCheck > 0 ? true : false
    }
    
    func pay(for money: Int) {
        self.money -= money
    }
    
    func drinkCoffee() {
        dailyCoffee += 1
    }
    
    func todayDrink() -> String {
        return "오늘은 \(dailyCoffee)잔의 커피를 마셨습니다."
    }
}
