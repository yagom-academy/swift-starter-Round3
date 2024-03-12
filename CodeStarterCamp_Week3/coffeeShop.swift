//
//  coffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by CHYUN on 3/1/24.
//

import Foundation

enum Coffee {
    case americano,
         cafeLatte,
         chocolateLatte,
         vanilaLatte,
         coldBrew,
         oatLatte,
         milkTea,
         vienna,
         iceCreamLatte
    
    var coffeeName: String {
        switch self {
        case .americano :
            return "아메리카노"
        case .cafeLatte :
            return "카페라떼"
        case .chocolateLatte :
            return "초콜릿라떼"
        case .vanilaLatte :
            return "바닐라라떼"
        case .coldBrew :
            return "콜드브루"
        case .oatLatte :
            return "오트라떼"
        case .milkTea :
            return "밀크티"
        case .vienna :
            return "비엔나"
        case .iceCreamLatte :
            return "아이스크림라떼"
        }
    }
}

class CoffeeShop {
    var barista: Person
    var menu: [Coffee: Int]
    var totalSales = 0
    var pickUpTable = Array<(String, Coffee)>() {
        didSet { callCustomer() }
    }
    
    init(barista: Person, menu: [Coffee: Int]) {
        self.barista = barista
        self.menu = menu
    }
    
    func make(_ coffee: Coffee, from name: String) {
        if let price = menu[coffee] {
            totalSales += price
            pickUpTable.append((name, coffee))
        } else {
            print("판매하지 않는 메뉴입니다.")
        }
    }
    
    func callCustomer() {
        if !pickUpTable.isEmpty {
            for (name, coffee) in pickUpTable {
                print("\(name)님이 주문하신 \(coffee.coffeeName)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
            }
        }
    }
    
}
