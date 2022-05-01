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
    var cafeMenu: [Coffee] = [.espresso, .americano, .latte]
    var pickUpTable: Coffee?
    
    init(barista: Person) {
        self.barista = barista
    }
    
    func order(_ order: Coffee) {
        print("주문 받기")
    }
    
    func brewCoffee() {
        print("커피 만들기")
    }
}
