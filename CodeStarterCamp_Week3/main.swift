//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Gender: String {
    case men = "남자"
    case women = "여자"
}

struct Person {
    let name: String
    var age: Int
    let gender: Gender
    var hight: Int
    var weight: Int
    var money: Int = 0
    
    mutating func greet() -> String {
        return "안녕하세요!!!"
    }
    mutating func introduce() -> String {
        return "저의 이름은 \(self.name)입니다. 저는 \(self.age)살이고 키는 \(self.hight)cm 몸무게는 \(self.weight)kg 입니다."
    }
    mutating func addOneToAge() {
        self.age += 1
    }
    mutating func calculateMoney(by amount: Int, sign: Int) -> Bool {
        if sign == -1 {
            if self.money < amount { return false }
            self.money -= amount
        } else {
            self.money += amount
        }
        return true
    }
    
    init?(name: String, age: Int, gender: Gender, hight: Int, weight: Int) {
        if name.isEmpty || !(0...120).contains(age) || hight <= 0 || weight <= 0 {
            return nil
        }
        self.name = name
        self.age = age
        self.gender = gender
        self.hight = hight
        self.weight = weight
    }
}
