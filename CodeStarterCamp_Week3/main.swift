//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee: String {
    case americano = "americano"
    case espresso = "espresso"
    case latte = "latte"
    
    var name: String {
        switch self {
        case .americano: return "americano"
        case .espresso: return "espresso"
        case .latte: return "latte"
        }
    }
}

let misterLee: Person = Person(fullName: "Lee", weight: 160, height: 60, nationality: "Korea", mbti: "INFP", money: 50000)
let missKim: Person = Person(fullName: "Kim", weight: 150, height: 40, nationality: "Korea", mbti: "ESTP", money: 50000)
let menus: [Coffee: Int] = [ .americano: 3000, .espresso: 4000, .latte: 4000]
let yagombucks: CoffeeShop = CoffeeShop(
    storeName: "yagombucks",
    address: "어디도 어디시 어디동 xx로",
    phoneNumber: "010-xxxx-xxxx",
    sales: 0,
    orderTable: [:],
    pickUpTable: [:],
    menus: menus
)

yagombucks.employBarista(barista: misterLee)
missKim.visitCoffeeShop(to: yagombucks)
missKim.orderCoffee(to: yagombucks, orderList: [.americano, .americano, .latte])
yagombucks.makeCoffee(from: missKim)
missKim.takeCoffee(to: yagombucks)
