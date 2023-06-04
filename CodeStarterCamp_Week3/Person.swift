//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by ChoiKwangWoo on 2023/06/04.
//

import Foundation

/*
 1. Person 타입을 정의합니다.
  - 사람이 공통적으로 가지는 특성을 프로퍼티로 정의해봅시다.
    돈이라는 속성을 가질 수 있도록 해봅시다.
  - 사람이 공통적으로 할 수 있는 동작을 메서드로 정의해봅시다.
    커피를 구매할 수 있도록 메서드를 정의해봅시다.
 */
class Person {
    var name: String
    var gender: Gender
    var MBTI: String
    var age: Int
    private var currentMoney: Int = 15_000
    
    init(name: String, gender: Gender, MBTI: String, age: Int) {
        self.name = name
        self.gender = gender
        self.MBTI = MBTI
        self.age = age
    }
    
    enum Gender {
        case man
        case woman
    }
    
    func orderCoffee(menu: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        let currentMoneyAfterOrder = self.currentMoney - menu.price
        guard currentMoneyAfterOrder >= 0 else {
            print("잔액이 \(-(currentMoneyAfterOrder))원 만큼 부족합니다.\n")
            return
        }
        coffeeShop.make(coffee: menu, for: name)
        self.currentMoney = currentMoneyAfterOrder
    }
    
    func spendMoney(price: Int) {
        self.currentMoney -= price
    }
    
    func makeMoney(salary: Int) {
        self.currentMoney += salary
    }
    
    func selfIntroduce() {
        print("제 이름은 \(self.name)구요. 나이는 \(self.age)살, MBTI는 \(self.MBTI)입니다.")
    }
    
    func walk() {
        print("걷는다")
    }
    
    func showCurrentMoney() {
        print("현재 잔액: \(self.currentMoney)\n")
    }
}
