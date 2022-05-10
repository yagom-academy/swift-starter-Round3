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
    
    mutating func buyCoffee(where shop: inout CoffeeShop, coffee: Coffee) {
        shop.checkMenu(orderer: self, menu: coffee)
        if canBuyCoffee(from: shop) {
            payMoney(shop.orderList.price)
            shop.order(from: self)
            pickUpCoffee(from: &shop)
        } else {
            print("잔액이 \(shop.orderList.price - money)원만큼 부족합니다. 주문을 취소합니다.")
            shop.orderList = (.none, 0)
        }
    }
    
    func canBuyCoffee(from shop: CoffeeShop) -> Bool {
        if money >= shop.orderList.price {
            return true
        } else {
            return false
        }
    }
    
    mutating func payMoney(_ selectedMenuPrice: Int) {
        print("돈을 \(selectedMenuPrice)원 지불합니다.")
        self.money -= selectedMenuPrice
        print("수중에 남은 돈은 \(self.money)원 입니다.")
    }
    
    func pickUpCoffee(from shop: inout CoffeeShop) {
        if shop.isOrderReady {
            print("주문한 메뉴를 픽업합니다. ☕️")
            shop.isOrderReady = false
        } else {
            print("메뉴가 아직 준비되지 않았습니다.")
        }
    }
}
