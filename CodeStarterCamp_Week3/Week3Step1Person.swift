//
//  Week3Step1.swift
//  CodeStarterCamp_Week3
//
//  Created by mingmac on 2022/05/01.
//

import Foundation

class Person {
    let name: String
    var money: Int = 10000
    var job: String?
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, job: String) {
        self.name = name
        self.job = job
    }
    
    func buy(kindOf drink: Coffee) {
        print("\(name)이(가) \(drink)을(를) 구매하였습니다. 가격은 \(drink.rawValue)원 입니다!")
    }
}
