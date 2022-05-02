//
//  Week3Step1Coffee.swift
//  CodeStarterCamp_Week3
//
//  Created by mingmac on 2022/05/01.
//

import Foundation

enum Coffee: CaseIterable {
    case espresso, americano, latte
    
    var price: Int {
        switch self {
        case .espresso:
            return 3000
        case .americano:
            return 3500
        case .latte:
            return 4500
        }
    }
}
