//
//  Coffee.swift
//  CodeStarterCamp_Week3
//
//  Created by Tony Lim on 2023/06/09.
//

import Foundation

enum Coffee: Hashable {
    case Americano
    case Latte
    case CafeMoca
    
    var name: String {
        switch self {
        case .Americano:
            return "Americano"
        case .Latte:
            return "Latte"
        case .CafeMoca:
            return "CafeMoca"
        }
    }
}
