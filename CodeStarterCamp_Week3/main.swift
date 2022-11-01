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
    var gender: String
    var age: Int
    var money: Int
    
    mutating func orderCoffee(coffeeShop: CoffeeShop, coffee: Coffee) {
        if let price = coffeeShop.menu[coffee] {
            
            if money >= price {
                money = money - price
                return print("커피 가격은 \(price)원입니다.\n남은 돈 \(money)원 드리겠습니다.")
            } else {
                print("죄송합니다. 돈이 부족하여 커피를 구매할 수 없습니다.")
            }
            
        }
    }
}


struct CoffeeShop {
    var shopName: String
    var revenue: Int?
    var barista: Person
    var menu: [Coffee: Int] = [:]
    var pickUpTable: [Coffee] = []

    mutating func makeCoffee(ordererName: String, coffee: Coffee) {
        pickUpTable.append(coffee)
        print("\(ordererName)님 주문하신 \(pickUpTable[0]) 나왔습니다.")
    }
}

enum Coffee: String {
    case americano
    case latte
    case ade
    case smoothie
}


var misterLee: Person = Person(name: "misterLee", gender: "male", age: 28, money: 30000)
var missKim: Person = Person(name: "missKim", gender: "female", age: 21, money: 20000)
var yagombucks: CoffeeShop = CoffeeShop(shopName: "yagombucks", barista: misterLee, menu: [.americano: 2000, .latte: 2500, .ade: 3000, .smoothie: 4000], pickUpTable: [])


misterLee.orderCoffee(coffeeShop: yagombucks, coffee: .americano)
yagombucks.makeCoffee(ordererName: "hyemory", coffee: .americano)

