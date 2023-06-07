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
    
    func coffeeOrder(menu: [Coffee], coffeeShop: CoffeeShop) {
        var remainCoffee: [Coffee] = []
        for coffee in menu {
            let currentMoneyAfterOrder = self.currentMoney - coffee.price
            
            guard currentMoneyAfterOrder >= 0 else {
                remainCoffee.append(coffee)
                continue
            }
            
            self.currentMoney = currentMoneyAfterOrder
            coffeeShop.make(coffee: coffee)
        }
        
        let remainCoffeeNameList = remainCoffee.map{ $0.name }.joined(separator: ", ")
        let madeCoffeeList = coffeeShop.getPickUpTable().map{ $0.name }.joined(separator: ", ")
        print("\(self.name)님이 주문하신 커피 : \(madeCoffeeList)(이/가) 준비되었습니다. \n픽업대에서 가져가주세요.\n")
        
        if remainCoffeeNameList.count > 0 {
            let lackOfMoney = remainCoffee.map{ $0.price }.reduce(0, +)
            print("\(lackOfMoney)원의 부족으로 \(remainCoffeeNameList)의 커피를 구매하지 못했습니다.")
        }
    }
    
    func spendMoney(price: Int) {
        self.currentMoney -= price
    }
    
    func make(money: Int) {
        self.currentMoney += money
    }
    
    func selfIntroduce() {
        print("제 이름은 \(self.name)구요. 나이는 \(self.age)살, MBTI는 \(self.MBTI)입니다.")
    }
    
    func showCurrentMoney() {
        print("현재 잔액: \(self.currentMoney)\n")
    }
}
