//
//  File.swift
//  CodeStarterCamp_Week3
//
//  Created by Jack Lee on 2023/06/13.
//

import Foundation

/*
 1. coffeeShop 타입 yagombucks 생성
 2. make 메서드로 커피를 추출 >> make(_ coffee: Coffee, for name: String)
 3. 추출된 커피는 pickupTable에 올리고 안내 문구 출력
 4. 주문과 동시에 돈이 매출액만큼 증가
 */

class CoffeeShop {
    private var name: String
    private var totalProfit: Int
    private var menu: [Coffee: Int]
    private var pickupTable: [Coffee]
    private var barista: Person?
    
    init(name: String, totalProfit: Int, menu: [Coffee: Int], pickupTable: [Coffee], barista: Person? = nil) {
        self.name = name
        self.totalProfit = totalProfit
        self.menu = menu
        self.pickupTable = pickupTable
        self.barista = barista
    }
    
    enum Coffee {
        case americano
        case espresso
        case latte
        
        var price: Int {
            switch self {
            case .americano:
                return 4500
            case .espresso:
                return 3000
            case .latte:
                return 5500
            }
        }
    }
    
    func make(_ coffee: Coffee, for name: String) {
        print("\(name) 님이 주문하신 카푸치노(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        self.totalProfit += coffee.price
    }
}
