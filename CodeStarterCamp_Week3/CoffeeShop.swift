//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 황지웅 on 2022/04/26.
//

import Foundation

class CoffeeShop {
    var barista: Person? = nil
    var coffeeMenu: CoffeeMenu
    var salesMoney: Int
    var pickUpTable: PickUpTable = PickUpTable()
    
    init(coffeeMenu: CoffeeMenu) {
        salesMoney = 0
        self.coffeeMenu = coffeeMenu
    }
    
    func hireBarista(barista: Person) {
        self.barista = barista
    }
    
    func depositMoney(coffeePrice: Int) {
    }
    
    func insertOrderToPickUpTable(orderMan: String, coffee: Coffee) {
    }
    
    func order(coffee: Coffee) {
    }
}
