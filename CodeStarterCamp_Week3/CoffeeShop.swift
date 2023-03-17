//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by Dean on 2023/03/16.
//

import Foundation

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
    
    func sell(_ coffee: Coffee) {
        if let coffeePrice = self.menu[coffee] {
            sales += coffeePrice
        }
    }
    
    func make(_ coffee: Coffee, for name: String) {
        print("결제가 완료됐습니다")
        sell(coffee)
        print("커피를 추출하고 있습니다")
        pickUpTable.append(coffee)
        print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}
