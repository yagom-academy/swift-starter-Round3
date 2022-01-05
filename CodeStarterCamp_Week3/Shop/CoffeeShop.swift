//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 박세웅 on 2021/12/29.
//

import Foundation

class CoffeeShop {
    var revenue: Int
    var pickUpTable: String {
        didSet {
            print("\(pickUpTable) 님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
    var barista: Person
    var customer: Person?
    
    init(barista: Person) {
        self.revenue = 0
        self.pickUpTable = ""
        self.barista = barista
    }
    
    func order(coffee: Coffee) {
        self.revenue += coffeePrice(coffee: coffee)
        if let customerName = customer?.name {
            pickUpTable = customerName
        }
    }
    
    func coffeePrice(coffee: Coffee) -> Int {
        switch coffee {
        case .americano:
            return 2500
        case .espresso, .latte:
            return 3000
        case .hotChocolate:
            return 3500
        }
    }
    
    func coffeeName(coffee: Coffee) -> String {
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
