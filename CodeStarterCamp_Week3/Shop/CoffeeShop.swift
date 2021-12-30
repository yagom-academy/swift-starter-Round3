//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 박세웅 on 2021/12/29.
//

import Foundation

struct CoffeeShop {
    var revenue: Int
    var pickUpTable: [String : String] = [String : String]()
    var barista: Person
    
    mutating func takeOrder(customer: Person, coffee: Coffee) {
        self.revenue = self.revenue + coffee.price
        print("\(customer.name) 님, 주문하신 \(coffee.name) 나왔습니다.")
        self.pickUpTable.updateValue(coffee.name, forKey: customer.name)
    }
}
