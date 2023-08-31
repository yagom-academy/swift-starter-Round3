//
//  PersonStep2.swift
//  CodeStarterCamp_Week3
//
//  Created by QL Jeong on 2023/08/31.
//

import Foundation

class PersonStep2: Person {
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShopStep2, by name: String) -> String {
        let price = coffeeShop.getPrice(of: coffee)
        if price < 0 {
            return "주문 할 수 없는 메뉴 입니다."
        }

        if money < price {
            return "잔액이 \(price - money)원만큼 부족합니다."
        }

        var result = ""
        let orderStatus = coffeeShop.make(coffee, from: name)
        switch orderStatus {
        case .success(let orderResult):
            _ = requestPayment(price)
            result = orderResult
        case .failure(let error):
            result = error.message
        }

        return result
    }
}
