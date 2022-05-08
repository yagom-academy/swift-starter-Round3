//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct Person {
    var name: String
    var age: Int
    var hight: Int
    var money: Int
    
    func enterCoffeShop() {
        print("커피를 사러 도착했습니다.")
    }

    func buyCoffee(price: Int) {
        if money >= price {
            let change = money - price
         print("음료는 \(price)원 입니다. \(money)원 받았습니다.")
            if change > 0 {
                print("거스름돈 \(change)원 입니다.")
            }
        } else {
            print("소지금이 부족합니다.")
        }
    }
}

struct CoffeeShop {
    var barista: Person
    var sales: Int = 0
    var coffeeMenuboard = [String : Int]()
    var pickUpTable: String?
    
    func orderCoffee(menu: String) {
        print("\(menu)주문 받았습니다.")
    }
    func makeCoffee(menu: String) {
        print("\(menu)제조 중입니다.")
    }
}

enum Coffee: String {
    case espresso = "에스프레소", americano = "아메리카노", cafeLatte = "카페라떼" , cappuccino = "카푸치노", cafeMocha = "카페모카", caramelMacchiato = "카라멜마끼아또"
}

let missKim: Person = Person(name: "MissKim", age: 23, hight: 160, money: 50000)
let misterLee: Person = Person(name: "MisterLee", age: 26, hight: 180, money: 30000)
let yagombucks: CoffeeShop = CoffeeShop(barista: misterLee)


