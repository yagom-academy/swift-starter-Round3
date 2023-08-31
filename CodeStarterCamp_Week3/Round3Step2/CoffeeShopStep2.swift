//
//  CoffeeShopStep2.swift
//  CodeStarterCamp_Week3
//
//  Created by QL Jeong on 2023/08/31.
//

import Foundation

class CoffeeShopStep2: CoffeeShop {
    func getPrice(of coffee: Coffee) -> Int {
        guard let item = getMenuItem(of: coffee) else {
            return -1
        }

        return item.price
    }

    func make(_ coffee: Coffee, from name: String) -> Result<String, OrderError> {
        if barista == nil {
            return .failure(.isNotOpen)
        }

        guard let item = getMenuItem(of: coffee) else {
            return .failure(.isNotInMenu)
        }

        _ = saleMenuItem(of: item)
        let result = "\(name) 님이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요."

        return .success(result)
    }
}
