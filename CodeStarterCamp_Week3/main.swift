//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//MARK: - Person 만들기

struct Person {
    var name : String
    var age : Int
    var money : Int
    var pastime : String?
    
 init(name: String, age: Int, money: Int,  pastime: String) {
        self.init(name: name, age: age, money: money)
        self.pastime = pastime
    }
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    mutating func buyCoffee() -> String {
        
        let order = "\(name)은 커피를 주문합니다."
        return order
    }
    
    func enjoyLeisureTime() {
        if let pastime = pastime {
            print("\(name)은 '\(pastime)'을/를 즐깁니다.")
        } else {
            print("\(name)은 여가시간에 무엇을 할지 못 정했습니다.")
        }
    }
}

