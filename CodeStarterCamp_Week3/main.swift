//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation



struct Person {
    var name: String
    var gender: String
    var money: Int?
    var job: String?
    
    init(name: String, gender: String, money: Int?) {
        self.name = name
        self.gender = gender
        self.money = money
    }
    init(name: String, gender: String, job: String?) {
        self.name = name
        self.gender = gender
        self.job = job
    }
    
    func buyCoffee() { }
    func work() { }
}


class CoffeeShop {
    var dailyTotal: Int
    var menu: String
    var pickUpTable: Bool
    
    init(dailyTotal: Int, menu: String, pickUpTable: Bool) {
        self.dailyTotal = dailyTotal
        self.menu = menu
        self.pickUpTable = pickUpTable
    }
    
    func sayHello() { }
    func Order(_ coffee: Coffee) { }
    func makeCoffee() { }
}



enum Coffee {
    case americano
    case cafeLatte
    case cafeMocha
    
    var menuName: String {
        switch self {
        case .americano: return "americano"
        case .cafeLatte: return "cafeLatte"
        case .cafeMocha: return "cafeMocha"
        }
    }
    var price: Int {
        switch self {
        case .americano: return 4000
        case .cafeLatte: return 5000
        case .cafeMocha: return 6000
        }
    }
}


let misterLee: Person = Person(name: "Mr.Lee", gender: "남성", job: "barista")
let missKim: Person = Person(name: "Miss.Kim", gender: "여성", money: 10000)


let yagombucks: CoffeeShop = CoffeeShop(dailyTotal: 0, menu: "", pickUpTable: true)
let yagombucksBarista = misterLee
