//
//  coffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 수염 on 2022/05/05.
//

import Foundation


class CoffeeShop {
    var dailyTotal: Int
    var menu: String
    var pickUpTable: Bool
    
    init(dailyTotal: Int, menu: String, pickUpTable: Bool) {
        self.dailyTotal = dailyTotal
        self.menu = menu
        self.pickUpTable = pickUpTable
    }
    
    func order(_ coffee: Coffee) { }
    func makeCoffee() { }
}
