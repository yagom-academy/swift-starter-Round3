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
    var totalProfit: Int
    private var pickupTable: [Any]
    private var barista: Person?
    
    init(name: String, totalProfit: Int, pickupTable: [Any], barista: Person? = nil) {
        self.name = name
        self.totalProfit = totalProfit
        self.pickupTable = pickupTable
        self.barista = barista
    }
    
    enum Soup {
        case potato
        case veggie
        
        var price: Int {
            switch self {
            case .potato:
                return 6000
            case .veggie:
                return 5000
            }
        }
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
    
    func makeCoffee(_ coffee: Coffee, for customer: Person) {
        pickupTable.append(coffee)
        print("\(customer.isName()) 님이 주문하신 카푸치노(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        self.totalProfit += coffee.price
    }
    
    func heatSoup(_ soup: Soup, for customer: Person) {
        pickupTable.append(soup)
        print("주문하신 \(soup)는 데워드리겠습니다.")
        self.totalProfit += soup.price
    }
}
