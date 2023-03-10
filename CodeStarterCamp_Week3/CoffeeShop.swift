//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by eve on 2023/03/10.
//

import Foundation

class CoffeeShop {
    var menu: [Coffee: Int]
    var barista: Person
    var revenue: Int = 0
    var pickUpTable: [Coffee] = [] {
        willSet(newValue) {
            if let coffee = newValue.last?.rawValue {
                print("\(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.\n")
            }
        }
    }
    
    init(menu: [Coffee: Int], barista: Person) {
        self.menu = menu
        self.barista = barista
    }
    
    private func takeOrder(_ coffee: Coffee) {
        guard let price = menu[coffee] else { return }
        revenue += price
        print("커피숍의 매출액: \(revenue)원\n")
    }
    
    func make(_ coffee: Coffee, from name: String) {
        takeOrder(coffee)
        print("커피 추출 중...")
        print("커피 완성!\n")
        print("\(name) 님이 주문하신 ", terminator: "")
        pickUpTable.append(coffee)
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case latte = "라떼"
    case cappuccino = "카푸치노"
    case macchiato = "마끼아또"
}
