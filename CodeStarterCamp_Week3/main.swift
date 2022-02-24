//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee {
    case americano
    case latte
    case espresso
    case fruitSmoothie
}

struct Person {
    var name: String
    var money: Int
    
    mutating func buySomething(somethingPrice: Int) {
        if self.money >= somethingPrice {
            let minus = self.money - somethingPrice
            print("\(self.name)이 구매를 완료했습니다. 잔액은 \(minus)원 입니다")
        } else {
            print("잔액이 부족합니다.")
        }
    }
}
var misterLee = Person(name: "misterLee", money: 100000)
var missKim = Person(name: "missKim", money: 100000)
