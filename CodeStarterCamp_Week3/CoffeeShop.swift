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
    var pickUpTable: [String:Coffee] = [String:Coffee]() {
        didSet(oldValue) {
            let key: String = (pickUpTable.keys).map{String($0)}[0]
            if let pickUpCoffee = pickUpTable[key] {
                print("\(key) 님이 주문하신 \(pickUpCoffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
            }
        }
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
        pickUpTable[name] = coffee
    }
}
