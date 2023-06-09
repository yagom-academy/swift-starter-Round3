//
//  Coffee.swift
//  CodeStarterCamp_Week3
//
//  Created by Tony Lim on 2023/06/09.
//

import Foundation

enum Coffee: Hashable {
    enum CoffeeType {
        case Hot
        case Iced
    }
    
    case Americano(CoffeeType, Int)
    case Latte(CoffeeType, Int)
    case CafeMoca(CoffeeType, Int)
    
    var menuName: String {
        var menuName = ""
        switch self {
        case .Americano(let coffeeType, _):
            if coffeeType == CoffeeType.Iced {
                menuName += "Iced"
                menuName += " "
            }
            menuName += "Americano"
        case .Latte(let coffeeType, _):
            if coffeeType == CoffeeType.Iced {
                menuName += "Iced"
                menuName += " "
            }
            menuName += "Latte"
        case .CafeMoca(let coffeeType, _):
            if coffeeType == CoffeeType.Iced {
                menuName += "Iced"
                menuName += " "
            }
            menuName += "CafeMoca"
        }
        return menuName
    }
}
