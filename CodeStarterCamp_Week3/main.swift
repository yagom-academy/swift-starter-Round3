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
    
    mutating func order(coffees: [Coffee]) {
        var totalPrice: Int = 0
        
        for coffee in coffees {
            if let price = yagombucks.menu[coffee] {
                totalPrice += price
            }
        }
        if money >= totalPrice {
            yagombucks.make(coffee: coffees, from: name)
            money -= totalPrice
            yagombucks.sales += totalPrice
        } else {
            print("잔액이 \(totalPrice - money)만큼 모잘랍니다")
        }
    }
}

struct CoffeeShop {
    let shopName: String
    var barista: Person
    var sales: Int = 0
    var menu: [Coffee: Int]
    var pickUpTable: [String] = []
    
    mutating func make(coffee: [Coffee], from name: String){
        for coffees in coffee {
            pickUpTable.append(coffees.rawValue)
        }
        print("\(name) 님이 주문하신 \(pickUpTable.joined(separator: ", "))(이/가) 준비되었습니다, 픽업대에서 가져가주세요")
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case latte = "라뗴"
    case smoothie = "스무디"
    case tea = "티"
}

var misterLee: Person = Person(name: "misterLee", gender: "male", age: 50, money: 10000)
var missKim: Person = Person(name: "missKim", gender: "female", age: 48, money: 10000)
var yagombucks: CoffeeShop = CoffeeShop(shopName: "yagombucks", barista: misterLee, menu: [.americano: 1500, .latte: 2500, .tea: 3000, .smoothie: 4500])

missKim.order(coffees: [.americano, .smoothie, .tea])
print("\(missKim.name)님 작액은 \(missKim.money)원 입니다")
print("\(yagombucks.shopName)의 총 매출은 \(yagombucks.sales)원 입니다")
