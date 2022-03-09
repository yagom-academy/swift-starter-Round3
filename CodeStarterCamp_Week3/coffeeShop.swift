//
//  structForCaffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 정주호 on 07/03/2022.
//

import Foundation


class CoffeeShop {
    var totalRevenue: Int
    var menu: [Coffee: Int] = [.americano: 5000, .latte: 5500, .cappuccino: 5500]
    var barista: Person
    var pickUpTable: String? = nil {
        didSet {
            print("\(pickUpTable!)가 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
    init(totalRevenue: Int, menu: [Coffee: Int] = [.americano: 5000, .latte: 5500, .cappuccino: 5500], barista: Person) {
        self.totalRevenue = totalRevenue
        self.menu = menu
        self.barista = barista
    }
    
    func takeOrder(coffee: Coffee, person: Person) {
        print("네 \(coffee)주문 받았습니다.")
        totalRevenue += coffee.price
        person.money -= coffee.price
        takeOutCoffee(coffee: coffee)
    }
    
    
    func takeOutCoffee(coffee: Coffee) {
        pickUpTable = String("\(coffee)")
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
