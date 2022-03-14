//
//  structForPerson.swift
//  CodeStarterCamp_Week3
//
//  Created by 정주호 on 08/03/2022.
//

import Foundation

class Person {
    var name: String
    var age: Int
    var money: Int
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    // juho님 기존 코드
//    func order(coffee: Coffee) {
//        print("\(coffee) 주세요")
//    }
    
    // 매개변수를 현재는 Coffee 타입을 받고 있는데요.
    // 재사용 가능한 함수를 위해, 가격만 받으려면 Int 로 바꿔주면 좋을 것 같아요.
    func order(price: Int) {
        self.money -= price
    }
}



