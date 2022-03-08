//
//  File.swift
//  CodeStarterCamp_Week3
//
//  Created by NAMU on 2022/03/07.
//

import Foundation

class CoffeeShop {
    var take = 0
    var menu = [Coffee: Int]()
    var putOnThePickupTable = false
    var barista: Person?
    
    init(menu: [Coffee: Int]) {
        self.menu = menu
    }
    
    func takeOrder(_ coffee: Coffee, from person: Person) {
        switch coffee{
        case .americano:
            if let americano = menu[.americano]{
                makecoffee(americano, for: person)
            }
        case .latte:
            if let latte = menu[.latte]{
                makecoffee(latte, for: person)
            }
        case .cappuccino:
            if let cappuccino = menu[.cappuccino]{
                makecoffee(cappuccino, for: person)
            }
        }
    }
    
    func makecoffee(_ coffeePrice: Int, for person: Person) {
        if person.money >= coffeePrice {
            person.purchase(coffeePrice)
            putOnThePickupTable = true
            take += coffeePrice
            print("구매성공")
        } else {
            print("돈이 부족합니다.")
        }
        putOnThePickupTable = false
    }
}
