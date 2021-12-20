//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 조민호 on 2021/12/20.
//

import Foundation

struct CoffeeShop {
    private(set) var sales: Int
    var barista: Person?
    private(set) var menu: [Coffee:Int]
    private(set) var pickUpTable: [Coffee]
    
    mutating func order(coffee: Coffee) {
        
    }
    
    mutating func brewCoffee(coffee: Coffee) {
    
    }
}
