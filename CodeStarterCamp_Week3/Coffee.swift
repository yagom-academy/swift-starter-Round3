//
//  Coffee.swift
//  CodeStarterCamp_Week3
//
//  Created by Lee minyeol on 2023/06/14.
//

import Foundation

enum Coffee: String {
    case americano = "아메리카노"
    case latte = "라떼"
    
    var price: Int {
        switch self {
        case .americano:
            return 5000
        case .latte:
            return 6000
        }
    }
}
