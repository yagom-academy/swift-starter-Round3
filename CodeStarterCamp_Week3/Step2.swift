//
//  Step2.swift
//  CodeStarterCamp_Week3
//
//  Created by Daehoon Lee on 2023/03/07.
//

import Foundation

enum Coffee {
    case americano
    case cafelatte
    case blacktea
    case cafemocha
    
    var koreanName: String {
        switch self {
        case .americano:
            return "아메리카노"
        case .cafelatte:
            return "카페라떼"
        case .blacktea:
            return "홍차"
        case .cafemocha:
            return "카페모카"
        }
    }
}

struct OrderInformation {
    var customer: String
    var coffee: Coffee
}

struct Person {
    var name: String
    var money: Int
    
    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        guard let priceOfOrderedCoffee = coffeeShop.menu[coffee] else {
            print("주문할 수 없는 메뉴입니다.")
            return
        }

        guard self.money >= priceOfOrderedCoffee else {
            print("잔액이 \(priceOfOrderedCoffee - self.money)원만큼 부족합니다.")
            return
        }
        
        coffeeShop.make(coffee, for: self.name)
        self.money -= priceOfOrderedCoffee
        coffeeShop.salesRevenue += priceOfOrderedCoffee
    }
}

class CoffeeShop {
    var barista: Person
    var salesRevenue: Int = 0
    var menu: Dictionary<Coffee, Int> = [
        Coffee.americano: 2000,
        Coffee.cafelatte: 3000,
        Coffee.blacktea: 2500,
        Coffee.cafemocha: 3000
    ]
    var pickUpTable: Array<OrderInformation> = Array<OrderInformation>() {
        didSet {
            guard let orderInformation = pickUpTable.last else { return }
            print("\(orderInformation.customer) 님이 주문하신 \(orderInformation.coffee.koreanName)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
    
    init(barista: Person) {
        self.barista = barista
    }
    
    func make(_ coffee: Coffee, for name: String) {
        self.serveCoffee(ordered: coffee, to: name)
    }
    
    func serveCoffee(ordered coffee: Coffee, to name: String) {
        self.pickUpTable.append(OrderInformation(customer: name, coffee: coffee))
    }
}
