//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var money: Int
    init(money: Int) {
        self.money = money
    }
    func buySomething(price: Int) {
        print(money-price)
    }
}
