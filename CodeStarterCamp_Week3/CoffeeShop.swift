//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by Lee minyeol on 2023/06/14.
//

import Foundation

class CoffeeShop {
    var barista: Person
    var profit: Int = 0
    var menuboard: [Coffee : Int] = [:]
    var pickUpTable: [Coffee] = [] {
        willSet {
            print("주문하신 커피가 완성되었습니다")
        }
    }
    
    init(barista: Person, profit: Int, menuboard: [Coffee : Int], pickUpTable: ()) {
        self.barista = barista
        self.profit = 0
        self.menuboard = menuboard
    }
    
    func make(_ coffee: Coffee, for name: String) {
        pickUpTable.append(coffee)
        print("\(name)이 주문하신 \(coffee.rawValue)나왔습니다. 픽업대에서 가져가세요.")
        profit += coffee.price
    }
    
    func coffeeShopprofit(coffee: Coffee) {
        profit += coffee.price
        print("매출액은 \(profit)입니다.")
    }
}
