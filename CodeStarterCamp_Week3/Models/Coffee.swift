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
    
    var price: Int {
        switch self {
        case .americano:
            return 2000
        case .latte:
            return 3000
        }
    }
}
