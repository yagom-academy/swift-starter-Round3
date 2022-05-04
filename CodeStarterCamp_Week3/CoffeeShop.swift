//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by Seong A Oh on 2022/05/05.
//

import Foundation

class CoffeeShop {
    var revenue: Int
    var menu: [Coffee : Int]
    var barista: [Person] = []
    var pickUpTable: Array<Coffee>?
    
    init(revenue: Int, menu: [Coffee: Int]) {
        self.revenue = revenue
        self.menu = menu
    }
    
    func order(coffee: Coffee) {
        guard let coffeePrice = self.menu[coffee] else {
            return
        }
        self.revenue += coffeePrice
        self.pickUpTable?.append(coffee)
    }
}

enum Coffee {
    case espresso
    case americano
    case vanillaLatte
    case cafeMocha
}
