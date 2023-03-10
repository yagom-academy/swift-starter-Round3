//
//  CoffeePosMachine.swift
//  CodeStarterCamp_Week3
//
//  Created by minsong kim on 2023/03/06.
//

import Foundation

struct Person {
    var money: Int
    
    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        guard let price = coffeeShop.menu[coffee] else {
            print("이 메뉴는 현재 판매하고 있지 않습니다.")
            return
        }
        if money < price {
            print("잔액이 \(price - money)원만큼 부족합니다.")
        } else {
            money -= price
            coffeeShop.make(coffee, for: name)
        }
        
    }
}

enum Coffee: String {
    case americano, decaffeine
    case latte, vanilla, caramel, cappuccino
    
    var name: String {
        switch self {
        case .americano:
            return "아메리카노"
        case .decaffeine:
            return "디카페인"
        case .latte:
            return "라떼"
        case .vanilla:
            return "바닐라라떼"
        case .caramel:
            return "카라멜 마끼아또"
        case .cappuccino:
            return "카푸치노"
        }
    }
}

class CoffeeShop {
    var barista: Person?
    var totalSales: Int = 0
    var pickUpTable: Array<String> = []
    var menu: [Coffee: Int] = [.americano: 2500, .decaffeine: 2500, .vanilla: 3500, .caramel: 3500, .cappuccino: 3500]
    
    fileprivate func make(_ coffee: Coffee, for name: String) {
        guard let price = menu[coffee] else {
            return
        }
        
        totalSales += price
        pickUpTable.append(coffee.name)
        print("\(pickUpTable)")
        print("\(name) 님이 주문하신 \(coffee.name)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}
