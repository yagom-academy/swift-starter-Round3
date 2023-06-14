//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 심정민 on 2023/06/14.
//

import Foundation

class CoffeeShop {
    var sales: Int
    var barista: Person
    var pickUpTable: (String, Coffee) -> Void = { (name: String, coffee: Coffee) in
        print("\(name)이 주문하신 \(coffee)가 나왔습니다.")
    }
    var menuList: [Coffee: Int] = [.americano: 4500, .latte: 4800, .espresso : 4000]
        
    init(sales: Int, barista: Person) {
        self.sales = sales
        self.barista = barista
    }
    
    func takingOrder() {
        print("커피 주문을 받습니다.")
    }

    func makeCoffee(_ coffee: Coffee, for name: String) {
        if let money = menuList[coffee] {
            self.sales += money
        }
        pickUpTable(name, coffee)
    }
}
