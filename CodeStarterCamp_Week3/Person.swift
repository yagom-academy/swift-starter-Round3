//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by Nat Kim on 2023/12/15.
//

import Foundation

protocol Job {
    var roleType: String { get }
}

extension Job {
    var roleType: String {
        return String(describing: Self.self).lowercased()
    }
}

struct PersonRole: Job {
    let roleType: String
}


struct Person {
    var job: Job
    var money: Int
    
    mutating func order(_ coffee: Coffee,
                        of coffeeShop: inout CoffeeShop,
                        by name: String) {
        
        guard let price: Int = coffeeShop.menu[coffee] else {
            print("판매하지 않는 커피 종류입니다.")
            return
        }
        if money >= price {
            coffeeShop.make(coffee, for: name)
            money -= price
        } else {
            let shortageAmount = price - money
            print("잔액이 \(shortageAmount)원만큼 부족합니다.")
        }
    }
}
