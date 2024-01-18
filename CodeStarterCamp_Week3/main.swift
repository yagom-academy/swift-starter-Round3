//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var money: Int
    
    init(money: Int = 0) {
        self.money = money
    }
    
    func buyCoffee() {
        
    }
}

class CoffeeShop {
    
    enum Coffee {
        case americano, latte, hazelnuts
    }
    
    var sales: Double = 0.0
    var menus: [Coffee: Double] = [.americano: 3000, .latte: 3500, .hazelnuts: 4000]
    var pickUpTable = [Coffee]()
    var barista: Person?
    
    func takeOrder(coffee: Coffee) {
        self.makeCoffee(name: coffee)
    }
    
    private func makeCoffee(name coffee: Coffee) {
        self.pickUpTable.append(coffee)
    }
    
    func employment(person: Person) {
        self.barista = person
    }
}


var misterLee: Person = Person()
var missKim: Person = Person()

var yagombucks = CoffeeShop()

yagombucks.employment(person: misterLee)

//yagombucks.takeOrder(coffee: .americano)
//yagombucks.takeOrder(coffee: .hazelnuts)
//yagombucks.takeOrder(coffee: .hazelnuts)
//
//print(yagombucks.pickUpTable)



