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
            yagombucks.make(coffees: coffees, from: name)
            money -= totalPrice
            
        } else {
            print("잔액이 \(totalPrice - money)만큼 부족합니다.")
        }
    }
}

struct CoffeeShop {
    var shopName: String
    var revenue: Int = 0
    var barista: Person
    var menu: [Coffee: Int] = [:]
    
    mutating func make(coffees: [Coffee], from name: String) {
        var totalPrice: Int = 0
        var pickUpTable: [Coffee] = [] {
            didSet {
                print("\(name)님이 주문하신", terminator: " ")
                
                for count in pickUpTable {
                    if count != pickUpTable[pickUpTable.count - 1] {
                        print(count.rawValue, terminator: ", ")
                    } else {
                        print(count.rawValue, terminator: "")
                    }
                }

                print("(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
            }
        }
        pickUpTable = coffees
        
        for coffee in coffees {
            if let price = menu[coffee] {
                totalPrice += price
            }
        }
        
        revenue += totalPrice
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case latte = "라떼"
    case ade = "에이드"
    case smoothie = "스무디"
}


var misterLee: Person = Person(name: "misterLee", gender: "male", age: 28, money: 10000)
var missKim: Person = Person(name: "missKim", gender: "female", age: 21, money: 100000)
var yagombucks: CoffeeShop = CoffeeShop(shopName: "yagombucks", barista: misterLee, menu: [.americano: 2000, .latte: 2500, .ade: 3000, .smoothie: 4000])


missKim.order(coffees: [.americano, .latte, .smoothie])
print("\(yagombucks.shopName)의 현재 매출액은 \(yagombucks.revenue)원")
print("\(missKim.name)의 잔액은 \(missKim.money)원")

