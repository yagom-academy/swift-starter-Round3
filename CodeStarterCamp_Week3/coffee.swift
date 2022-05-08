//
//  coffee.swift
//  CodeStarterCamp_Week3
//
//  Created by 수염 on 2022/05/05.
//

import Foundation


enum Coffee: CaseIterable {
    case americano
    case cafeLatte
    case cafeMocha
    
    var menuName: String {
        switch self {
        case .americano:
            return "아메리카노"
        case .cafeLatte:
            return "카페라떼"
        case .cafeMocha:
            return "카페모카"
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
