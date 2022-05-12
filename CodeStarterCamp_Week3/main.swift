//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

enum Coffee: String {
    case espresso = "에스프레소",
         americano = "아메리카노",
         cafeLatte = "카페 라떼" ,
         cappuccino = "카푸치노",
         cafeMocha = "카페 모카",
         caramelMacchiato = "카라멜 마끼아또"
}

class Person {
    let name: String
    var age: Int
    var height: Int
    var money: Int
    
    init(name: String, age: Int, height: Int, money: Int) {
        self.name = name
        self.age = age
        self.height = height
        self.money = money
    }
    
    func buy(_ coffee: Coffee, at coffeeShop: CoffeeShop) {
        if money >= (yagomBucks.coffeeMenuboard[coffee] ?? 0) {
            money = money - (yagomBucks.coffeeMenuboard[coffee] ?? 0)
            yagomBucks.order(coffee, by: self)
        } else {
            print("잔액이 \((coffeeShop.coffeeMenuboard[coffee] ?? 0) - money)원 부족합니다.")
        }
    }
}

class CoffeeShop {
    var barista: Person
    var sales: Int
    var coffeeMenuboard = [Coffee : Int]()
    var customer: Person?
    var pickupTable: Coffee? {
        didSet {
            if let coffeeMenu = pickupTable, let customer = self.customer  {
                    print("\(customer.name)의 \(coffeeMenu.rawValue)가 준비되었습니다. 픽업 테이블에서 가져가주세요.")
            }
        }
    }

    init(barista: Person, sales: Int = 0, coffeeMenuBoard: [Coffee : Int], pickupTable: Coffee?, customer : Person?) {
        self.barista = barista
        self.sales = sales
        self.coffeeMenuboard = coffeeMenuBoard
        self.customer = customer
    }
    
    func order(_ coffee: Coffee, by guest: Person) {
        customer = guest
        make(coffee)
        sales = sales + (coffeeMenuboard[coffee] ?? 0)
    }
    
    func make(_ coffee: Coffee) {
        print("\(coffee.rawValue)를 제조 중입니다.")
        pickupTable = coffee
    }
}

let missKim: Person = Person(name: "김미영", age: 23, height: 160, money: 6600)
let misterLee: Person = Person(name: "이삼사", age: 26, height: 180, money: 40000)
let yagomBucks: CoffeeShop = CoffeeShop(barista: misterLee, coffeeMenuBoard:
                                            [Coffee.espresso: 3100,
                                             Coffee.americano: 4000,
                                             Coffee.cafeLatte: 4200,
                                             Coffee.cafeMocha: 4500,
                                             Coffee.cappuccino: 4600,
                                             Coffee.caramelMacchiato: 5000],
                                        pickupTable: nil, customer: nil)

missKim.buy(.cappuccino, at: yagomBucks)
misterLee.buy(.americano, at: yagomBucks)
