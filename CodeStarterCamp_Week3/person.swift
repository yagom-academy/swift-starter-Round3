//
//  person.swift
//  CodeStarterCamp_Week3
//
//  Created by daekyo on 2023/10/24.
//

import Foundation

class Person {
    var money: Int
    var name: String
    
    init(money: Int, name: String) {
        self.money = money
        self.name = name
    }
    
    func order(_ coffee: Coffee, at coffeeShop: CoffeeShop) {
        if let coffeeCost = coffeeShop.menuPan[coffee] {
            let myCheckMoney = myMoneyCheckFor(by: coffeeCost)
            
            if myCheckMoney > 0 {
                coffeeShop.takeOrderFor(coffee: coffee, by: self)
            } else {
                if myCheckMoney == 0 {
                    print("잔액이 \(coffeeCost)원만큼 부족합니다.")
                } else {
                    print("잔액이 \(myCheckMoney * -1)원만큼 부족합니다.")
                }
            }
        } else {
            print("\(coffee.name)는 없는 메뉴 입니다.")
        }
    }
    
    func myMoneyCheckFor(by cost: Int) -> Int {
        return self.money - cost
    }
}
