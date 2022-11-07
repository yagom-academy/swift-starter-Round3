//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var gender: String
    var moneyOnHand: Int
    var job: String
    init(name: String, gender: String, moneyOnHand: Int, job: String) {
        self.name = name
        self.gender = gender
        self.moneyOnHand = moneyOnHand
        self.job = job
    }
    func buy(_ coffee: Coffee) {
        print("\(coffee.rawValue) 주세요.")
    }
}

class Coffeeshop {
    var turnover: Int
    let menuList = [Coffee.americano: 4500, Coffee.latte: 5000, Coffee.coldbrew: 5000, Coffee.frappuccino: 6000]
    var pickUpTable = [Coffee]()
    var barista: Person
    
    init(turnover: Int, barista: Person) {
        self.turnover = turnover
        self.barista = barista
    }
    
    func takeOrdersAndMakeCoffee(){
        print("\(barista.name)가 주문을 받아 커피를 만듭니다.")
    }
    func putCoffeeOnPickUpTable(orderedCoffee: Coffee) {
        let coffeeForSale = orderedCoffee.rawValue
        print("주문하신 \(coffeeForSale) 나왔습니다.")
        
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case latte = "라떼"
    case coldbrew = "콜드브루"
    case frappuccino = "프라푸치노"
}

let missKim: Person = Person(name: "missKim", gender: "female", moneyOnHand: 50000, job: "student")

let misterLee: Person = Person(name: "misterLee", gender: "male", moneyOnHand: 50000, job: "barista")

missKim.buy(Coffee.americano)


let yagombucks: Coffeeshop = Coffeeshop(turnover: 0, barista: misterLee)
yagombucks.takeOrdersAndMakeCoffee()
yagombucks.putCoffeeOnPickUpTable(orderedCoffee: Coffee.americano)
