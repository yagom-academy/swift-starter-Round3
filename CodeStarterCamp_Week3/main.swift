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
    
    mutating func order(_ coffee: Coffee) {
        if let coffeePrice = yagombucks.menu[coffee] {
            if money >= coffeePrice {
                yagombucks.make(coffee, from: name)
                money -= coffeePrice
                yagombucks.sales += coffeePrice
            } else if money <= coffeePrice {
                print("잔액이 \(coffeePrice - money)원만큼 부족합니다.")
                }
            }
        }
    }

struct CoffeeShop {
    var cafeName: String
    var barista: Person
    var menu: [Coffee: Int] = [:]
    var pickUpTable: [Coffee] = []
    var sales: Int = 0
    
    func takeOrder(_ coffee: Coffee) {
        if let price = menu[coffee] {
            print("\(coffee.rawValue) \(price)원 결제 도와드리겠습니다.")
        }
    }
    mutating func make(_ coffee: Coffee, from name: String) {
            pickUpTable.append(coffee)
            print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case cafeLatte = "카페라테"
    case cafeMocha = "카페모카"
    case grapefruitAde = "자몽에이드"
    case chamomileTea = "카모마일티"
}

var misterLee: Person = Person(name: "misterLee", gender: "male", age: 25, money: 10000)
var missKim: Person = Person(name: "missKim", gender: "female", age: 20, money: 30000)
var yagombucks: CoffeeShop = CoffeeShop(cafeName: "yagombucks", barista: misterLee, menu: [.americano: 4000, .cafeLatte: 4500, .cafeMocha: 5000, .grapefruitAde: 5500, .chamomileTea: 5500])

missKim.order(.americano)
