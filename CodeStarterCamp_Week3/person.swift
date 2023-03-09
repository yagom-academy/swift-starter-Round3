//
//  person.swift
//  CodeStarterCamp_Week3
//
//  Created by JSB on 2023/03/09.
//

struct Person {
    var haveMoney: Int
    var nickName: String
    var coffeeShop: CoffeeShop?
    
    //커피 주문하는 함수
    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        
        if let coffeePrice = coffeeShop.menu[coffee] {
            if self.haveMoney >= coffeePrice {
                self.haveMoney -= coffeePrice
                coffeeShop.revenue += coffeePrice
                self.nickName = name
                coffeeShop.make(coffee, for: nickName)
            }
            else {
                print("잔액이 \(coffeePrice - self.haveMoney)원만큼 부족합니다.")
            }
        }
        else {
            print("해당 커피가 없습니다.")
        }
        
    }
}
