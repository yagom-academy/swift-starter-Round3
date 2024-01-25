//
//  Coffee.swift
//  CodeStarterCamp_Week3
//
//  Created by 맨태 on 1/25/24.
//

import Foundation

enum Coffee {
    case americano
    case espresso
    case cappuccino
    
    var name: String {
        switch self {
        case .americano: return "아메리카노"
        case .espresso: return "에스프레소"
        case .cappuccino: return "카푸치노"
        }
    }
}
