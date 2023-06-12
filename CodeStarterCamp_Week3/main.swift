//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var name : String
    var money : Int
    
    mutating func buyCoffee (coffee: Coffee) {
        print("\(coffee.rawValue) 구매할게요")
    }
    
    mutating  func payMoney(coffee: Coffee, coffeeshop: CoffeeShop) {
        if let coffeePrice = coffeeshop.menuboard[coffee.rawValue] {
            if money < coffeePrice {
                print("돈이 부족합니다.")
            }
            return print("결제 완료됐습니다.")
        }
    }
}

var misterLee : Person = Person(name: "misterLee", money: 5000)
var missKim : Person = Person(name: "missKim", money: 6000)

missKim.buyCoffee(coffee: .amricano)


struct CoffeeShop {
    var brista : Person
    var profit : Int
    var menuboard : [String : Int] = ["americano" : 2000, "latte" : 4000]
    var pickUpTable : [String] = []
    
    mutating  func orderCoffee(coffee: Coffee) {
        print("주문한 \(coffee.rawValue)가 나왔습니다.")
    }
}

var yagombucks : CoffeeShop = CoffeeShop(brista: misterLee, profit: 0, pickUpTable: [])

yagombucks.orderCoffee(coffee: .amricano)

enum Coffee : String {
    case amricano = "아메리카노"
    case latte = "라떼"
}

