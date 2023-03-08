//
//  Step1.swift
//  CodeStarterCamp_Week3
//
//  Created by eve on 2023/03/08.
//

import Foundation

struct Person {
    let name: String
    var money: Int = 0
    
    mutating func order(_ coffee: Coffee, in shop: CoffeeShop) {
        let price = shop.menu[coffee] ?? 0
        if money >= price {
            money = money - price
            print("\(name) 님이 \(coffee.rawValue)(을/를) 주문하였습니다. (잔액: \(money)원)\n")
            shop.takeOrder(coffee, from: name)
        } else {
            print("잔액이 \(price - money)원만큼 부족합니다.\n")
        }
    }
}

class CoffeeShop {
    var menu: [Coffee: Int]
    var barista: Person
    var revenue: Int = 0
    var pickUpTable: [Coffee] = []
    
    init(menu: [Coffee: Int], barista: Person) {
        self.menu = menu
        self.barista = barista
    }
    
    func takeOrder(_ coffee: Coffee, from name: String) {
        revenue += menu[coffee] ?? 0
        print("\(name) 님의 주문이 수락되어 커피 추출을 시작합니다. (매출액: \(revenue)원)\n")
        make(coffee, from: name)
    }
    
    func make(_ coffee: Coffee, from name: String) {
        print("커피 추출 중...")
        print("커피 완성!\n")
        pickUpTable.append(coffee)
        print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.\n")
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case latte = "라떼"
    case cappuccino = "카푸치노"
    case macchiato = "마끼아또"
}
