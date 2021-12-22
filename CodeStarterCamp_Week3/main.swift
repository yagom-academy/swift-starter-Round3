//  main.swift
//  CodeStarterCamp_Week3
//  Created by yagom
//  Copyright © yagom academy. All rights reserved

import Foundation

struct Person {
    let name: String
    let birthYear: Int
    var purse: Int?
    
    init(name: String, birthYear: Int) {
        self.name = name
        self.birthYear = birthYear
    }
    
    func buy(something: Any) {
        
    }
    
    func move(to: Any) {
        print("\(name)님이 \(to)로 이동합니다.")
    }
    
    func have(something: Any) {
        
    }
}

enum Coffee {
    case americano
    case espresso
    case cafeLatte
    case caffeMocha
    case hotChocolate
    
    var price: Int {
        switch self {
        case .americano:
            return 3000
        case .espresso:
            return 2500
        case .cafeLatte:
            return 3500
        case .caffeMocha:
            return 3500
        case .hotChocolate:
            return 3500
        }
    }
}

struct CoffeeShop {
    private var totalSales: Int = 0
    var barista: Person
    var pickUpTable: [Coffee]?
    
    init(barista: Person) {
        self.barista = barista
    }
    
    mutating func orderDrink(coffee: Coffee) {
        print("\(coffee) 메뉴와 \(coffee.price)지불 받았습니다.")
        totalSales += coffee.price
        makeDrink(coffee: coffee)
    }
    
    func makeDrink(coffee: Coffee) {
        print("\(coffee)를 준비중 입니다.")
    }
}

var misterLee = Person(name: "Mr.Lee", birthYear: 1998)
var misterkim = Person(name: "Mr.Kim", birthYear: 1997)
misterLee.purse = 10000
misterkim.purse = 10000

let yagombucks = CoffeeShop(barista: misterLee)
