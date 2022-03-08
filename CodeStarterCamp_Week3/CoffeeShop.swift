//
//  File.swift
//  CodeStarterCamp_Week3
//
//  Created by NAMU on 2022/03/07.
//

import Foundation

class CoffeeShop {
    var take = 0
    let americano = 1000
    let latte = 2000
    let cappuccino = 3000
    var putOnThePickupTable = false
    var barista: Person?
    
    func takeOrder(_ coffee: Coffee, from person: Person) {
        switch coffee{
        case .americano:
            makecoffee(americano, for: person)
        case .latte:
            makecoffee(latte, for: person)
        case .cappuccino:
            makecoffee(cappuccino, for: person)
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
