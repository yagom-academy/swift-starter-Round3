//
//  CoffeeMenu.swift
//  CodeStarterCamp_Week3
//
//  Created by ChoiKwangWoo on 2023/06/04.
//

import Foundation

/*
 3. Coffee 타입(열거형)을 생성합니다.
    커피의 여러 종류들을 case로 가질 수 있도록 해봅시다.
 */
enum Coffee: CaseIterable {
    case espresso
    case americano
    case latte
    case ade
    
    var name: String {
        switch self {
        case .espresso: return "에스프레소"
        case .americano: return "아메리카노"
        case .latte: return "라떼"
        case .ade: return "에이드"
        }
    }
    
    var price: Int {
        switch self {
        case .espresso: return 2000
        case .americano: return 2000
        case .latte: return 4000
        case .ade: return 4500
        }
    }
    
    static func getCoffeeFromName(name: String) -> Coffee? {
        return Coffee.allCases.first{ "\($0.name)" == name }
    }
    
    static func getCoffeeMenus() -> [String: String] {
        var coffeeMenus: [String: String] = [:]
        Coffee.allCases.forEach{ coffee in
            coffeeMenus[coffee.name] = "\(coffee.price)원"
        }
        return coffeeMenus
    }

}
