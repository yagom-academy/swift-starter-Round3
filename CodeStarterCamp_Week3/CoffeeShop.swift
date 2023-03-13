//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 김형철 on 2023/03/09.
//

import Foundation



struct CoffeShop {
    var barista: Person?
    var sales: Int
    var menu: Dictionary<Coffee, CoffeePrice>
    var pickUpTable: [Coffee]
    
    mutating func takeOrder(for coffee: Coffee...) -> [Coffee] {
        
        for coffees in coffee {
            pickUpTable.append(coffees)
        }
        
        return pickUpTable
    }
    
    
}
