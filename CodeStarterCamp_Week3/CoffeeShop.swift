//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 김형철 on 2023/03/09.
//

import Foundation

typealias CoffeePrice = Int

struct CoffeShop {
    var barista: Person?
    var sales: Int
    var menu: Dictionary<Coffee, CoffeePrice>
    var pickUpTable: [Coffee]
    
    mutating func takeOrder(for coffees: Coffee...) -> [Coffee] {
        
        pickUpTable = []
        
        for coffee in coffees {
            pickUpTable.append(coffee)
        }
        
        return pickUpTable
    }
    
    
}
