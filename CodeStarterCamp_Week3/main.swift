//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// Step 1
enum Coffee: String {
    case espresso = "에스프레소"
    case americano = "아메리카노"
    case caffeLatte = "카페 라떼"
    case caffeMocaha = "카페 모카"
    case vanilaLatte = "바닐라 라떼"
    case caramelMacchiato = "카라멜 마끼아또"
}

struct Person {
    let name: String
    var money: Int
    
    mutating func order(_ coffee: Coffee, of coffeeShop: inout CoffeeShop) {
        guard let price = coffeeShop.menu[coffee] else {
            print("\(coffee.rawValue)의 정보가 없어 주문할 수 없습니다.\n")
            return
        }
        
        if money >= price {
            money -= price
            coffeeShop.takeOrder(coffee, by: self)
        } else {
            print("""
            잔액이 \(price - money)원 부족합니다.
            \(coffee.rawValue)의 가격: \(price)원
            \(name)님의 잔액: \(money)원\n
            """)
        }
    }
}

struct CoffeeShop {
    let name: String
    var totalSalesPrice: Int = 0
    var menu: [Coffee: Int]
    var pickUpTable: [(Person, Coffee)] = [] {
        willSet {
            if newValue.count > pickUpTable.count {
                guard let person = newValue.last?.0 else { return }
                guard let coffee = newValue.last?.1 else { return }
                
                print("\(person.name)님이 주문하신 \(coffee.rawValue)가 준비되었습니다. 픽업대에서 가져가주세요.\n")
            }
        }
    }
    var barista: Person
    
    mutating func takeOrder(_ coffee: Coffee, by person: Person) {
        guard let price = menu[coffee] else {
            print("\(coffee.rawValue)의 정보가 없어 주문할 수 없습니다.\n")
            return
        }
        
        totalSalesPrice += price
        
        make(coffee, for: person)
    }
    
    mutating func make(_ coffee: Coffee, for person: Person) {
        pickUpTable.append((person, coffee))
    }
}

var misterLee = Person(name: "이곰돌", money: 10000)
var missKim = Person(name: "김곰순", money: 3300)
var yagombucksMenu: [Coffee: Int] = [
    .americano: 4000,
    .caffeLatte: 4500,
    .caffeMocaha: 4500,
    .vanilaLatte: 4500
]
var yagombucks = CoffeeShop(
    name: "야곰벅스",
    menu: yagombucksMenu,
    barista: misterLee
)

missKim.order(.caffeLatte, of: &yagombucks)
misterLee.order(.espresso, of: &yagombucks)
misterLee.order(.vanilaLatte, of: &yagombucks)
misterLee.order(.americano, of: &yagombucks)
misterLee.order(.caffeMocaha, of: &yagombucks)
