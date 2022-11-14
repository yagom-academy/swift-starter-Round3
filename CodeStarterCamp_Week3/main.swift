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
                print("\(price)원으로 \(coffee.rawValue)를 구매했습니다. \n남은 돈은 \(money)원 입니다.")
            } else {
                ("소지하신 금액이 모자랍니다")
            }
        }
    }
}

struct CoffeeShop {
    let shopName: String
    var barista: Person
    var sales: Int?
    var menu: [Coffee: Int]
    var pickUpTable: [String]
    
    mutating func makeCoffe(orderedPeron: String, coffees: [Coffee]) {
        for coffee in coffees {
            pickUpTable.append(coffee.rawValue)
        }
        print("\(orderedPeron)님이 주문하신 \(pickUpTable.joined(separator: ", ")) 나왔습니다")
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case latte = "라뗴"
    case smoothie = "스무디"
    case tea = "티"
}

var misterLee: Person = Person(name: "misterLee", gender: "male", age: 28, money: 30000)
var missKim: Person = Person(name: "missKim", gender: "female", age: 21, money: 20000)
var yagombucks: CoffeeShop = CoffeeShop(shopName: "yagombucks", barista: misterLee, menu: [.americano: 1500, .latte: 2000, .smoothie: 4500, .tea: 3000], pickUpTable: [])

missKim.orderCoffee(coffeeShop: yagombucks, coffee: .smoothie)
yagombucks.makeCoffe(orderedPeron: missKim.name, coffees: [.smoothie])


