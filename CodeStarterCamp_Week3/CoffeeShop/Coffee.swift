//
//  Coffee.swift
//  CodeStarterCamp_Week3
//
//  Created by 조민호 on 2021/12/20.
//

import Foundation

enum Coffee {
    case americano
    case vanillaLatte
    case coldBrew
    
    var price: Int {
        switch self {
        case .americano: return 5000
        case .vanillaLatte: return 6000
        case .coldBrew: return 5500
        }
    }
}
