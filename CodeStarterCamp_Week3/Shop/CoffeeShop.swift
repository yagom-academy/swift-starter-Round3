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
        self.revenue = self.revenue + returnCoffeePrice(coffee: coffee)
        print("\(customer.name) 님, 주문하신 \(returnCoffeeName(coffee: coffee)) 나왔습니다.")
        self.pickUpTable.updateValue(coffee.name, forKey: customer.name)
    }
    
    func returnCoffeePrice(coffee: Coffee) -> Int {
        switch coffee {
        case .americano:
            return 2500
        case .espresso, .latte:
            return 3000
        case .hotChocolate:
            return 3500
        }
    }
    
    func returnCoffeeName(coffee: Coffee) -> String {
        switch coffee {
        case .americano:
            return "아메리카노"
        case .espresso:
            return "에스프레소"
        case .latte:
            return "라떼"
        case .hotChocolate:
            return "핫초코"
        }
    }
}
