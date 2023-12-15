//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by Nat Kim on 2023/12/15.
//

import Foundation

enum Coffee: String {
    case espresso   = "에스프레소"
    case americano  = "아메리카노"
    case cafeLatte  = "카페라떼"
    case cappuchino = "카푸치노"
    case machiatto  = "마키아또"
    case cafeMocha  = "카페모카"
}

struct CoffeeShop {
    
    var sales: Int // 카페의 매출액
    var menu: [Coffee: Int]
    var pickUpTable: String? = ""

    // 커피 제조 메소드
    mutating func make(_ coffee: Coffee,
                       for name: String) {
        
        guard let price: Int = menu[coffee] else {
            print("판매하지 않는 커피 종류입니다.")
            return
        }
        if price > 0 {
            pickUpTable?.append(coffee.rawValue)
            sales += price
        }
        if let upwrappedPickUpTable = pickUpTable {
            print("\(name) 님이 주문하신 \(upwrappedPickUpTable)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        }
        
    }
}
