//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 정선아 on 2022/04/27.
//

import Foundation
class Person {
    var name: String
    var age: Int
    var habit: String?
    var mbti: String?
    var getMoney: Int
    init(name: String, age: Int, habit: String, mbti: String, getMoney: Int) {
        self.name = name
        self.age = age
        self.habit = habit
        self.mbti = mbti
        self.getMoney = getMoney
    }
    init(name: String, age: Int, getMoney: Int){
        self.name = name
        self.age = age
        self.getMoney = getMoney
    }
    func buyCoffee() {
        print("\(name)이 커피를 삽니다.")
    }
}
