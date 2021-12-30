//
//  Coffee.swift
//  CodeStarterCamp_Week3
//
//  Created by 박세웅 on 2021/12/29.
//

import Foundation

enum Coffee {
    case americano, espresso, latte, hotChocolate
    
    var name: String {
        switch self {
        case .americano:
            return "아메리카노"
        case .espresso:
            return "에스프레소"
        case .latte:
            return "라떼"
        case .hotChocolate:
            return "핫초코"
        }
    }
    
    var price: Int {
        switch self {
        case .americano:
            return 2500
        case .espresso, .latte:
            return 3000
        case .hotChocolate:
            return 3500
        }
    }
}


