//
//  Coffee.swift
//  CodeStarterCamp_Week3
//
//  Created by marisol on 2022/01/03.
//

import Foundation

enum Coffee: Int {
    case americano
    case cafeLatte
    case cafeMocha
    case vanillaLatte
    
    var priceOfCoffee: Int {
        switch self {
        case .americano:
            return 4500
        case .cafeLatte:
            return 5000
        case .cafeMocha:
            return 5000
        case .vanillaLatte:
            return 6000
        }
    }
}
