//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var asset: Int
    var name: String
    var numberOfFamilyMembers: Int
    var job: String
    func purchaseSomeThing(price: Int) -> Int {
        let remainder = asset - price
        return remainder
    }
}

struct CoffeeShop {
    var turnover: Int
    var pickUpTable: Dictionary<String, Coffee>? = [String: Coffee]()
    var baristar: Person
    var menu: Dictionary<Coffee, Int> = [Coffee.americano : 4500,
                                         Coffee.cafeLatte : 5000,
                                         Coffee.cafeMocha : 5000,
                                         Coffee.vanillaLatte : 5000]
    func order(customer: String, coffee: Coffee) {
        print("\(customer) ordered \(coffee)")
    }
    mutating func brewCoffee(customer: String, coffee: Coffee) {
        print("\(customer)'s \(coffee) is now brewing...")
        pickUpTable?[customer] = coffee
    }
}

enum Coffee {
    case americano
    case cafeLatte
    case cafeMocha
    case vanillaLatte
}

var misterLee: Person = Person(asset: 20000, name: "misterLee", numberOfFamilyMembers: 3, job: "baristar")
var missKim: Person = Person(asset: 3000, name: "missKim", numberOfFamilyMembers: 2, job: "iOSDeveloper")
var yagombucks: CoffeeShop = CoffeeShop(turnover: 0, baristar: misterLee)

yagombucks.order(customer: missKim.name, coffee: Coffee.americano)
yagombucks.brewCoffee(customer: missKim.name, coffee: Coffee.americano)
