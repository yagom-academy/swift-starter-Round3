//
//  Coffee.swift
//  CodeStarterCamp_Week3
//
//  Created by 이지원 on 2023/06/03.
//

import Foundation

enum Coffee {
    case americano
    case latte
    
    var name: String {
        switch self {
        case .americano:
            return "아메리카노"
        case .latte:
            return "라떼"
        }
    }
}
