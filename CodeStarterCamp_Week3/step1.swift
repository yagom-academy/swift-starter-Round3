//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by MARY on 2023/03/07.
//

import Foundation

struct Person {
    let name: String
    var money: Int
    func order(_ coffee: Coffee, at coffeshop: CoffeeShop) {
        print("주문: \(coffee) (\(name))")
        coffeshop.make(coffee)
    }
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
}

class CoffeeShop {
    var salesRevenue: Int = 0
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee] = []
    var barista: String = "owner"
    func make(_ coffee: Coffee) {
        print("바리스타 \(barista)가 음료 제조 중...")
        pickUpTable.append(coffee)
        print("\(coffee)가 pick-up 테이블에 준비되었습니다.")
    }
    init(menu: [Coffee : Int]) {
        self.menu = menu
    }
}

enum Coffee {
    case americano, decafAmericano
    case vanillaLatte, hazelnutLatte, caramelmacchiato
}
