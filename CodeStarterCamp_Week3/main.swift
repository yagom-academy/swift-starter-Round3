//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee {
    case americano
    case latte
    case espresso
    case fruitSmoothie
}

struct Person {
    var name: String
    var money: Int
    
    mutating func buySomething(somethingPrice: Int) {
        if self.money >= somethingPrice {
            let minus = self.money - somethingPrice
            print("\(self.name)이 구매를 완료했습니다. 잔액은 \(minus)원 입니다")
        } else {
            print("잔액이 부족합니다.")
        }
    }
}
var misterLee = Person(name: "misterLee", money: 100000)
var missKim = Person(name: "missKim", money: 100000)

struct CoffeShop {
    var sales: Int
    var menu: [Coffee: Int]
    var pickUpTable: String
    var barista = Person(name: "", money: 0)

    mutating func orderCoffee(coffee: Coffee) {
        if let coffeePrice = menu[coffee] {
            sales += coffeePrice
        } else {
            print("다시 주문해주세요")
        }
    }
    mutating func makeCoffee(person: String, coffee: Coffee) {
        let finishCoffee = pickUpTable == "on"
        if finishCoffee {
            print("\(person)님 주문하신 \(coffee) 나왔습니다")
        } else {
            print("잠시만 기다려주세요")
        }
    }
}

var yagombucks = CoffeShop(sales: 200000, menu: [Coffee.americano: 4100, Coffee.latte: 4500], pickUpTable: "on")
yagombucks.barista = misterLee
