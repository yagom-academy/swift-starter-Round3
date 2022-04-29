//
//  Barista.swift
//  CodeStarterCamp_Week3
//
//  Created by 황지웅 on 2022/04/29.
//

import Foundation

class Barista: Person {
    weak var coffeeShop: Shop? = nil
    
    override init(name: String, money: Int) {
        super.init(name: name, money: money)
    }
    
    func getJob(coffeeShop: Shop?) {
        self.coffeeShop = coffeeShop
    }
    
    func makeCoffeeOrderFromShop(coffee: Coffee) {
        coffeeShop?.insertCoffeeToPickUpTable(coffee: coffee)
    }
}
