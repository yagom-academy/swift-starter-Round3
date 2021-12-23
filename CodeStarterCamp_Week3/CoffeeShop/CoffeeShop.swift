//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 조민호 on 2021/12/20.
//

import Foundation

class CoffeeShop {
    private(set) var sales: Int
    private(set) var menu: [Coffee: Int]
    private(set) var pickUpTable: [Coffee] = [] {
        didSet {
            guard let name = self.customer?.name else {
                return
            }
            print("\(name) 님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }

    var barista: Person?
    var customer: Person?
    
    init(sales: Int, menu: [Coffee: Int]) {
        self.sales = sales
        self.menu = menu
    }
    
    func order(coffee: Coffee) {
        guard let money = customer?.money else {
            return
        }
        
        guard money >= coffee.price else {
            print("잔액이 \(coffee.price - money)원만큼 부족합니다.")
            return
        }
        
        customer?.buy(coffee: coffee)
        self.sales += coffee.price
        brewCoffee(coffee: coffee)
    }
    
    private func brewCoffee(coffee: Coffee) {
        self.pickUpTable.append(coffee)
    }
}
