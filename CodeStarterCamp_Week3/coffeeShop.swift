//
//  structForCaffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 정주호 on 07/03/2022.
//

import Foundation

class CoffeeShop {
    var totalRevenue: Int
    var menu: [Coffee: Int]
    var barista: Person
    
    init(totalRevenue: Int, menu: [Coffee: Int], barista: Person) {
        self.totalRevenue = totalRevenue
        self.menu = menu
        self.barista = barista
    }
    
    func takeOrder(coffee: Coffee, customerName: Person) {
        print("네 \(coffee)주문 받았습니다.")
        totalRevenue += coffee.price
        customerName.money -= coffee.price
        pickUpTable(coffee: coffee, customerName: customerName)
    }
    
    func pickUpTable(coffee: Coffee, customerName: Person) {
        print("\(customerName.name) 님의 \(coffee)(이)가 준비되었습니다. 픽업대에서 가져가 주세요")
        
        
    }
}

enum Coffee {
    case americano
    case latte
    case cappuccino
    
    var price: Int {
        switch self {
        case .americano:
            return 5000
        case .latte:
            return 5500
        case .cappuccino:
            return 5500
        }
        
    }
}
