//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by Dean on 2023/03/16.
//

import Foundation

enum Coffee: String {
    case americano = "아메리카노"
    case caffeMocha = "카페모카"
    case latte = "라떼"
    case caramelMacchiato = "카라멜 마키아또"
}

class CoffeeShop {
    var sales: Int = 0
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee] = [] {
        willSet {
            print("주문하신 커피가 완성되었습니다")
        }
    }
    var barista: Person
    
    init(menu: [Coffee : Int], barista: Person) {
        self.menu = menu
        self.barista = barista
    }
    
    func make(_ coffee: Coffee, for name: String) {
        print("커피를 추출하고 있습니다")
        pickUpTable.append(coffee)
        print("\(name) 님이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}
