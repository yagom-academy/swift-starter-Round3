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
        print("[안내] \(name)님이 카페에 들어왔습니다.", "\n")
    }
    
    init(name: String, job: String) {
        self.name = name
        self.job = job
    }
    
    deinit {
        print("[안내] \(name)님이 카페를 나갑니다.")
    }
    
    func buy(kindOf drink: Coffee, at cafe: CoffeeShop) {
        if money < drink.price {
            let changes = drink.price - money
            print("[안내] \(drink)을(를) 주문하기에는 \(name)님의 잔액이 \(changes)원 부족합니다.")
        } else {
            print("[손님] 안녕하세요, \(cafe.barista.name)! \(drink) 주문할게요.")
            cafe.order(drink, for: self)
        }
        
    }
}
