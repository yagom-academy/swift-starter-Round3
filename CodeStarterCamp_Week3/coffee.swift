//
//  coffee.swift
//  CodeStarterCamp_Week3
//
//  Created by 수염 on 2022/05/05.
//

import Foundation


enum Coffee {
    case americano
    case cafeLatte
    case cafeMocha
    
    var menuName: String {
        switch self {
        case .americano:
            return "americano"
        case .cafeLatte:
            return "cafeLatte"
        case .cafeMocha:
            return "cafeMocha"
        }
    }
    var price: Int {
        switch self {
        case .americano:
            return 4000
        case .cafeLatte:
            return 5000
        case .cafeMocha:
            return 6000
        }
    }
}
