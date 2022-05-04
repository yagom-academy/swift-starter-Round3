//
//  Week3Step1CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by mingmac on 2022/05/01.
//

import Foundation

class CoffeeShop {
    var sales: Int = 0
    var barista: Person
    var cafeMenu = Coffee.allCases
    var pickUpTable: Coffee?
    
    init(barista: Person) {
        self.barista = barista
    }
    
    func order(_ order: Coffee) {
        print("\(order)를 주문하였습니다.")
    }
    
    func brewCoffee(_ drink: Coffee) {
        print("\(drink)를 제조합니다.")
    }
}
