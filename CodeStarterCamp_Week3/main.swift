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
    var age: Int
    var height: Int
    var money: Int
    
    init(name: String, age: Int, height: Int, money: Int) {
        self.name = name
        self.age = age
        self.height = height
        self.money = money
    }
    
    func buy(_ menu: Coffee) {
        yagomBucks.order(menu)
    }
}

class CoffeeShop {
    var barista: Person
    var sales: Int
    var coffeeMenuboard = [Coffee : Int]()
    var pickUpTable: Coffee?
    
    init(barista: Person, sales: Int = 0, coffeeMenuBoard: [Coffee : Int]) {
        self.barista = barista
        self.sales = sales
        self.coffeeMenuboard = coffeeMenuBoard
    }
    
    convenience init(barista: Person, sales: Int = 0, coffeeMemuBoard: [Coffee : Int], pickUpTable:Coffee) {
        self.init(barista: barista, sales: sales, coffeeMenuBoard: coffeeMemuBoard)
        self.pickUpTable = pickUpTable
    }
    
    func make(_ menu: Coffee) {
        print("\(menu)를 제조 중입니다.")
        yagomBucks.callCustomer(menu)
    }
    
    func order(_ coffee: Coffee) {
        yagomBucks.make(coffee)
        
    }
    
    func callCustomer(_ pickupMenu: Coffee) {
        print("\(pickupMenu)가 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

enum Coffee: String {
    case espresso = "에스프레소",
         americano = "아메리카노",
         cafeLatte = "카페라떼" ,
         cappuccino = "카푸치노",
         cafeMocha = "카페모카",
         caramelMacchiato = "카라멜마끼아또"
}
let missKim: Person = Person(name: "MissKim", age: 23, height: 160, money: 50000)
let misterLee: Person = Person(name: "MisterLee", age: 26, height: 180, money: 40000)
let yagomBucks: CoffeeShop = CoffeeShop(barista: misterLee, coffeeMenuBoard:
                                            [Coffee.espresso: 3100,
                                             Coffee.americano: 4000,
                                             Coffee.cafeLatte: 4200,
                                             Coffee.cafeMocha: 4500,
                                             Coffee.cappuccino: 4600,
                                             Coffee.caramelMacchiato: 5000])

missKim.buy(Coffee.espresso)
