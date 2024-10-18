//
//  cafe.swift
//  CodeStarterCamp_Week3
//
//  Created by 최범수 on 2024-10-03.
//

class CoffeeShop {
    var sales: Int = 0
    var pickUpTable: [(Coffee, String)] = []
    var barista: Person
    let menu: [Coffee: Int]
    
    init(menu : [Coffee: Int], barista: Person) {
        self.barista = barista
        self.menu = menu
    }
    
    func make(_ order: Coffee, by customer: Person, name: String) {
        if let price = menu[order] {
            if customer.money >= price {
                customer.money -= price
                sales += price
                print("\(name) 님이 주문하신 \(order.name)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
            } else {
                print("잔액이 \(price - customer.money)원만큼 부족합니다.")
            }
        } else {
            print("우리집에 그런거 안팔아요")
        }
    }
}
