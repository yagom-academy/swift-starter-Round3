//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee: String {
    case americano = "아메리카노"
    case smoothie = "스무디"
    case latte = "라떼"
    case tea = "티"
}

struct Person {
    var name: String
    var money: Int
    
    mutating func orderCoffee(coffee: Coffee, coffeeShop: CoffeeShop) {
        if let coffeePrice = coffeeShop.menu[coffee] {
            if money < coffeePrice {
                print("돈이 부족합니다")
            } else {
                money -= coffeePrice
                print("결제 완료됐습니다.")
            }
        }
    }
}

struct CoffeeShop {
    var sales: Int
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee] = []
    var barista: Person
    
    mutating func takeOrder(coffee: Coffee) {
        print("주문이 완료되었습니다")
        makeCoffee(coffee: coffee)
    }
    
    mutating func makeCoffee(coffee: Coffee) {
        print("주문하신 커피가 나왔습니다")
        pickUpTable.append(coffee)
    }
}

var misterLee = Person(name: "Lee", money: 20000)
var missKim = Person(name: "Kim", money: 30000)

var yagombucks = CoffeeShop(sales: 0, menu: [Coffee.americano: 2500, Coffee.smoothie: 3500, Coffee.latte: 3000, Coffee.tea: 3000], barista: misterLee)

