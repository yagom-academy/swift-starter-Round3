//
//  coffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by daekyo on 2023/10/24.
//

import Foundation

enum Coffee: String {
    case americano, iceAmericano, cafeLatte, hotChoco, vanillaLatte
    
    var name: String {
        switch self {
        case .americano: return "Americano"
        case .iceAmericano: return "Ice Americano"
        case .cafeLatte: return "Cafe Latte"
        case .hotChoco: return "Hot Choco"
        case .vanillaLatte: return "Vanilla Latte"
        }
    }
}

class CoffeeShop {
    var salesAmount: Int = 0
    var menuPan: [Coffee: Int] = [:]
    var pickUpTable: [Coffee] = []
    var barista: Person = Person(money: 0, name: "")
    
    func takeOrderFor(coffee: Coffee) {
        makeCoffeeFor(coffee: coffee)
    }
    
    func makeCoffeeFor(coffee: Coffee) {
        putOnTableFor(coffee: coffee)
    }
    
    func putOnTableFor(coffee: Coffee) {
        pickUpTable.append(coffee)
    }
}
