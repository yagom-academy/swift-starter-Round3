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
    var customerName = ""
    var barista: Person?
    
    init(menu: [Coffee: Int]) {
        self.menu = menu
    }
    
    func takeOrder(_ coffee: Coffee, from person: Person) {
        switch coffee{
        case .americano:
            if let americano = menu[.americano]{
                makeCoffee(americano, for: person)
            }
        case .latte:
            if let latte = menu[.latte]{
                makeCoffee(latte, for: person)
            }
        case .cappuccino:
            if let cappuccino = menu[.cappuccino]{
                makeCoffee(cappuccino, for: person)
            }
        }
    }
    
    func makeCoffee(_ coffeePrice: Int, for person: Person) {
        if person.money >= coffeePrice {
            person.purchase(coffeePrice)
            customerName = person.name
            putOnThePickupTable = true
            take += coffeePrice
        } else {
            print("잔액이 \(coffeePrice)만큼 부족합니다")
        }
        putOnThePickupTable = false
    }
}
