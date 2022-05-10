//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by Wonbi on 2022/05/09.
//

import Foundation

struct Person {
    let name: String
    var money: Int
    var payment: Int?
    
    mutating func buyCoffee(where shop: CoffeeShop, coffee: Coffee) {
        payment = shop.menuPlate[coffee]
        if let payment = payment {
            print("\(self.name)님이 주문하신 메뉴는 \(coffee.rawValue)입니다. 가격은 \(payment)입니다.")
            if money >= payment {
                payMoney(payment)
                shop.order(coffee, who: self)
                pickUp(where: shop)
            } else {
                print("잔액이 \(payment - money)원만큼 부족합니다.")
            }
        } else {
            print("매장 준비중입니다.")
        }
    }
    
    mutating func payMoney(_ selectedMenuPrice: Int) {
        print("돈을 \(selectedMenuPrice)원 지불합니다.")
        self.money -= selectedMenuPrice
        print("수중에 남은 돈은 \(self.money)원 입니다.")
        self.payment = 0
    }
    
    func pickUp(where shop: CoffeeShop) {
        if shop.pickUpTable {
            print("주문한 메뉴를 픽업합니다. ☕️")
            shop.pickUpTable = false
        } else {
            print("메뉴가 아직 준비되지 않았습니다.")
        }
    }
}
