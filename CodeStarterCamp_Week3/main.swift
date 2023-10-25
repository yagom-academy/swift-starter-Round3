//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var age: UInt
    var money: Int
    
    init?(name: String, age: UInt, money: Int = 0) {
        if (0...100).contains(age) == false || name.isEmpty {
            return nil
        }
        self.name = name
        self.age = age
        self.money = money
    }
    
    func earnMoney (salary: Int) {
        self.money = money + salary
        print("\(salary)의 월급을 받았습니다. 잔액이 \(money)가 되었습니다.")

    }
    
    func buyCoffee (coffeename: String, coffeePrice: Int) {
        if (self.money < coffeePrice) {
            print ("\(self.name)!! 잔액이 부족합니다. 현재잔액은 \(self.money)입니다.")
        } else {
            self.money = money - coffeePrice
            print("\(self.name)은(는) \(coffeename)을(를) 구입하였습니다. 남은 잔액은\(self.money)입니다.")
        }
    }
}

var missKim: Person? = Person(name: "missKim", age: 23, money: 2000)
var misterLee: Person? = Person(name: "misterLee", age: 30)

missKim?.buyCoffee(coffeename: "americano", coffeePrice: 1500)
misterLee?.buyCoffee(coffeename: "americano", coffeePrice: 1500)
misterLee?.earnMoney(salary: 3000)
misterLee?.buyCoffee(coffeename: "americano", coffeePrice: 1500)

