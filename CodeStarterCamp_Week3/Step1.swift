//
//  Step1.swift
//  CodeStarterCamp_Week3
//
//  Created by Daehoon Lee on 2023/03/06.
//

import Foundation

enum Coffee {
    case americano
    case cafelatte
    case blacktea
    case cafemocha
}

struct Person {
    var lastName: String
    var money: Int
    
    mutating func buyCoffee(with price: Int) {
        self.money = self.money - price
    }
}

class CoffeeShop {
    var barista: Person
    var salesRevenue: Int = 0
    var menu: Dictionary<Coffee, Int> = [Coffee.americano: 2000, Coffee.cafelatte: 3000, Coffee.blacktea: 2500, Coffee.cafemocha: 3000]
    var pickUpTable: Array<Coffee> = Array<Coffee>()
    
    init(barista: Person) {
        self.barista = barista
    }
    
    func takeOrderAndCreateCoffee(ordered coffee: Coffee) {
        print("order \(coffee)~")
        self.serveCoffee(ordered: coffee)
    }
    
    func serveCoffee(ordered coffee: Coffee) {
        print("Please come to the \(coffee) you ordered!!")
        self.pickUpTable.append(coffee)
    }
}
