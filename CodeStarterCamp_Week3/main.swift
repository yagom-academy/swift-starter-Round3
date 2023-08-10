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
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buyCoffee(coffeeShop: CoffeeShop, nameOfCoffee: Coffee) {
        if let price = coffeeShop.menu[nameOfCoffee], self.money >= price {
            self.money -= price
            print("\(nameOfCoffee)를 구입 하였습니다.")
            coffeeShop.takeOrder(nameOfCoffee: nameOfCoffee)
            coffeeShop.brew(coffee: nameOfCoffee)
        } else {
            print("돈이 부족하여 구입할 수 없습니다.")
        }
    }
}

class CoffeeShop {
    var sales: Int = 0
    var menu: [Coffee: Int] = [:]
    var pickUpTable: [Coffee] = []
    var barista: Person
    
    init(menu: [Coffee: Int], barista: Person) {
        self.menu = menu
        self.barista = barista
    }
    
    func takeOrder(nameOfCoffee: Coffee) {
        print("\(nameOfCoffee)를 주문 받았다.")
        if let income = self.menu[nameOfCoffee] {
            self.sales += income
            print("매출이 \(income)원 증가하였습니다.")
        }
    }
    
    func brew(coffee: Coffee) {
        print("\(coffee)를 완성했다.")
        pickUpTable.append(coffee)
    }
}

enum Coffee: String {
    case espresso
    case americano
    case cafeLatte
    case vanilaLatte
    
    var price: Int {
        get {
            switch self {
            case .espresso: return 2500
            case .americano: return 3500
            case .cafeLatte: return 4000
            case .vanilaLatte: return 4500
            }
        }
    }
}

var yagombucksMenu: [Coffee: Int] = [.americano: Coffee.americano.price, .espresso: Coffee.espresso.price, .cafeLatte: Coffee.cafeLatte.price, .vanilaLatte: Coffee.vanilaLatte.price]
var misterLee: Person = Person(name: "미스터리", money: 50000)
var missKim: Person = Person(name: "미스킴", money: 100000)
var yagombucks: CoffeeShop = CoffeeShop(menu: yagombucksMenu, barista: misterLee)

missKim.buyCoffee(coffeeShop: yagombucks, nameOfCoffee: Coffee.vanilaLatte)
missKim.buyCoffee(coffeeShop: yagombucks, nameOfCoffee: Coffee.americano)

print("야곰벅스의 매출액은 \(yagombucks.sales)원 입니다.")
print("\(missKim.name)의 잔액은 \(missKim.money) 입니다")
