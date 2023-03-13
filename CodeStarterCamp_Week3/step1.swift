//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by Dawn on 2023/03/13.
//

import Foundation

class Person {
    var money: Int
    var name: String
    
    init(money: Int, name: String) {
        self.money = money
        self.name = name
    }
    
    func buyCoffee(menu: Coffee, at cafe: CoffeeShop) {
        cafe.orderCoffee(orderItem: menu, money: money)
    }
}

enum Coffee: Int, CaseIterable {
    case 아메리카노 = 4500, 카페라떼 = 5000, 바닐라라떼 = 5500
}

class CoffeeShop {
    var sales: Int = 0
    var pickUpTable: [String] = [String]()
    var barista: String
    var menu: [Coffee: Int] = [Coffee.아메리카노:  Coffee.아메리카노.rawValue,
                              Coffee.카페라떼: Coffee.카페라떼.rawValue,
                              Coffee.바닐라라떼: Coffee.바닐라라떼.rawValue]
    
    init(barista: Person) {
        self.barista = barista.name
    }
    
    func orderCoffee(orderItem: Coffee, money: Int) {
        if money - orderItem.rawValue >= 0 {
            print("\(orderItem)를 선택하셨습니다. 주문하신 \(orderItem) 나왔습니다.")
            pickUpTable.append("\(orderItem)")
            sales += orderItem.rawValue
        } else {
            print("\(orderItem.rawValue - money)원이 부족합니다.")
        }
    }
}

let misterLee: Person = Person(money: 3000, name: "Lee")
let missKim: Person = Person(money: 5000, name: "Kim")

let yagombucks: CoffeeShop = CoffeeShop(barista: misterLee)
