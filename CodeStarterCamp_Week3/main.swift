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
    var height: Double
    var weight: Double
    var money: Int
    
    init(name: String, height: Double, weight: Double, money: Int) {
        self.name = name
        self.height = height
        self.weight = weight
        self.money = money
    }
    
    func buyingCoffee(from coffeeShop: CoffeeShop, typeOfCoffee: CoffeeShop.Coffee ) {
        coffeeShop.orderCoffee(from: self, typeOfCoffee: typeOfCoffee)
    }
}

class CoffeeShop {
    var sugarContent: Int // 당도
    var typeOfBeans: String // 원두종류
    var sales: Int
    var menu: Dictionary<Coffee, Int>
    var pickUpTable: [Coffee]
    var barista: Person
    
    init(sugarContent: Int, typeOfBeans: String, sales: Int, menu: Dictionary<Coffee, Int>, pickUpTable: [Coffee], barista: Person) {
        self.sugarContent = sugarContent
        self.typeOfBeans = typeOfBeans
        self.sales = sales
        self.menu = menu
        self.pickUpTable = []
        self.barista = barista
    }
    
    enum Coffee {
        case iceAmericano, caffeMocha, brewCoffee
    }
    
    func orderCoffee(from customer: Person, typeOfCoffee: Coffee) {
        if let price = menu[typeOfCoffee] {
            if customer.money >= price {
                customer.money -= price
                sales += price
                makeCoffee(cofee: typeOfCoffee)
                print("\(typeOfCoffee) 결제가 완료되었습니다.") // 코드가 제대로 작동되는지 확인하기 위함
            }
        }
    }
    
    func makeCoffee(cofee: Coffee) {
        pickUpTable.append(cofee)
    }
    
}

let misterLee = Person(name: "misterLee", height: 180.0, weight: 70.0, money: 30000)
let missKim = Person(name: "missKim", height: 170.0, weight: 60.0, money: 30000)
let yagombucksMenu: [CoffeeShop.Coffee: Int] = [.iceAmericano: 4000, .caffeMocha: 7000, .brewCoffee: 8000]


// -MARK: CoffeShop 타입 인스턴스 생성 및 바리스타 할당
let yagombucks = CoffeeShop(sugarContent: 40, typeOfBeans: "Luwak", sales: 0, menu: yagombucksMenu, pickUpTable: [], barista: misterLee)

misterLee.buyingCoffee(from: yagombucks, typeOfCoffee: .caffeMocha)
