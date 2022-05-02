//
//  File.swift
//  CodeStarterCamp_Week3
//
//  Created by Jiyoung Lee on 2022/05/01.
//

import Foundation

class Person {
    var money: Int = 0
    
    func buyCoffee(coffee: Coffee) {
    }
}

class CoffeeShop {
    var sales: Int = 0
    var barista: Person
    var menuBoard: [Coffee: Int] = [:]
    var pickUpTable = [Coffee]()

    
    init(barista: Person) {
        self.barista = barista
    }
    
    
    func receiveOrder() {
        
    }
    
    func makeCoffee() {
        
    }
}

enum Coffee {
    case Americano, Latte, Mocha
}
