//
//  Persons.swift
//  CodeStarterCamp_Week3
//
//  Created by Jack Lee on 2023/06/13.
//

import Foundation

/*
 1. Person 타입 instance missKim 생성
 2. missKim은 커피를 구매하는 order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) 메서드를 실행해
    yagomBucks의 make(_ coffee: Coffee, for name: String) 메서드를 호출
 3. 주문과 동시에 돈은 커피의 가격만큼 즐어든다.
 4. 돈이 커피 가격보다 적게 있다면 다음 문구 출력 - 잔액이 1200원 만큼 부족합니다.
 */

class Person {
    private var name: String
    var money: Int
    private var gender: Gender
    private var job: CoffeeShop?
    private var drinkSelected: [CoffeeShop.Coffee: Int]
    
    init(name: String, money: Int, gender: Gender, job: CoffeeShop? = nil,
         drinkSelected: [CoffeeShop.Coffee: Int] = [:]) {
        self.name = name
        self.money = money
        self.gender = gender
        self.job = job
        self.drinkSelected = drinkSelected
    }

    enum Gender {
        case male, female
    }
    
    func order(_ coffee: CoffeeShop.Coffee, of coffeeShop: CoffeeShop, by name: String) {
        guard money >= coffee.price else  { print("잔액이 \(coffee.price - self.money) 부족하다... 집에 가자"); return }
        
        print("\(coffee) 한 잔 주문할게요. \(name)으로 불러주세요.")
        yagomBucks.make(coffee, for: name)
        self.money -= coffee.price
    }
}
