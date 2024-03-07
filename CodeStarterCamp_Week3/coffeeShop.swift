//
//  coffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by CHYUN on 3/1/24.
//

import Foundation

enum Coffee: String {
    case americano =  "아메리카노",
         cafeLatte = "카페라떼",
         chocolateLatte = "초콜릿라떼",
         vanilaLatte = "바닐라라떼",
         coldBrew = "콜드브루",
         oatLatte = "오트라떼",
         milkTea = "밀크티",
         vienna = "비엔나",
         iceCreamLatte = "아이스크림라떼"
}

class CoffeeShop {
    var barista: Person
    var menu: [Coffee: Int]
    var totalSales = 0
    var pickUpTable = Array<(String, Coffee)>() {
        didSet { call() }
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
    
    func call() {
        if !pickUpTable.isEmpty {
            for (name, coffee) in pickUpTable {
                print("\(name)님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
            }
        }
    }
    
}
