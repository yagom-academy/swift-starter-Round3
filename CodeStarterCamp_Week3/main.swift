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
    
    func order(_ coffee: Coffee) {
        // TODO: 주문 코드 작성
    }
}

struct CoffeeShop {
    let name: String
    var totalSalesPrice: Int = 0
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee] = []
    var barista: Person
    
    mutating func make(_ coffee: Coffee) {
        pickUpTable.append(coffee)
    }
}

var misterLee = Person(name: "이곰돌", money: 10000)
var missKim = Person(name: "김곰순", money: 20000)
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
