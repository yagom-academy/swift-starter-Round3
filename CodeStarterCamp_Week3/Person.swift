//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by tom on 2023/03/08.
//

import Foundation

struct Person {
    let name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buyCoffee(coffeeShop: CoffeeShop, coffee: Coffee) {
        print("\(name)은 가지고 있는 \(money)원으로 \(coffeeShop.name)에서 \(coffeeShop.barista.name)가 만들어주는 \(coffee)를 커피를 주문했다")
    }
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        if let price = coffeeShop.menu[coffee] {
            let myMoney : Int = money
            let coffeePrice : Int = price
            let changeMoney = myMoney - coffeePrice
            let absChangeMoney = abs(changeMoney)
            
            if myMoney >= coffeePrice {
                coffeeShop.make(coffee.self, for: name)
                print("\(name)의 남은돈 \(absChangeMoney)원 입니다.")
            } else {
                print("\(name)의 잔액이 \(absChangeMoney)원만큼 부족 합니다")
                return
            }
        } else {
            print("주문 하신 \(coffee)은 저희 매장에 없는 메뉴 입니다.")
            return
        }
        print("\(name)님이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요")
    }
}
