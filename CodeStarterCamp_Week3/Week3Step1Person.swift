//
//  Week3Step1.swift
//  CodeStarterCamp_Week3
//
//  Created by mingmac on 2022/05/01.
//

import Foundation

class Person {
    let name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(kindOf drink: Coffee) {
        print("\(name)이(가) \(drink)을(를) 구매하였습니다. 가격은 \(drink.rawValue)원 입니다!")
    }
}
