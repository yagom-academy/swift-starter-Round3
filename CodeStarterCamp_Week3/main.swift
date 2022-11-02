//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    let gender: String
    var age: Int
    var money: Int
    
    mutating func orderCoffee(coffeeShop: CoffeeShop, coffee: Coffee) {
        if let price = coffeeShop.menu[coffee] {
            if money >= price {
                money = money - price
                print("\(price)원으로 커피를 구매했습니다. \n남은 돈은 \(money)원 입니다.")
            } else {
                print("커피를 구매할 돈이 부족합니다.")
            }
        }
    }
}

struct CoffeeShop {
    var shopName: String
    var revenue: Int?
    var barista: Person
    var menu: [Coffee: Int] = [:]
    var pickUpTable: [String] = []

    mutating func makeCoffee(ordererName: String, coffee: [Coffee]) {
        for count in 0...[coffee].count + 1 {
            pickUpTable.append(coffee[count].rawValue)
        }
        print("\(ordererName)님 주문하신 \(pickUpTable.joined(separator: ", ")) 나왔습니다.")
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case latte = "라떼"
    case ade = "에이드"
    case smoothie = "스무디"
}


var misterLee: Person = Person(name: "misterLee", gender: "male", age: 28, money: 30000)
var missKim: Person = Person(name: "missKim", gender: "female", age: 21, money: 20000)
var yagombucks: CoffeeShop = CoffeeShop(shopName: "yagombucks", barista: misterLee, menu: [.americano: 2000, .latte: 2500, .ade: 3000, .smoothie: 4000], pickUpTable: [])


misterLee.orderCoffee(coffeeShop: yagombucks, coffee: .americano)
yagombucks.makeCoffee(ordererName: misterLee.name, coffee: [.americano, .latte, .ade])

