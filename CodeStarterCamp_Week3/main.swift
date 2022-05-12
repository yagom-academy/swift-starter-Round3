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
    var gender: genderList
    enum genderList {
        case male
        case female
    }
    var money: Int
    
    init(name: String, age: Int, gender: genderList, money: Int) {
        self.name = name
        self.age = age
        self.gender = gender
        self.money = money
    }
    
    func placeOrder(with coffee: Coffee, to coffeeShop: CoffeeShop) {
        yagombucks.customer = self
        
        if let myMenu  = coffeeShop.menu[coffee] {
            if self.money - myMenu < 0 {
                print("잔액이 \(self.money)원만큼 부족합니다")
            } else {
                self.money -= myMenu
                coffeeShop.order(coffee)
            }
        }
    }
}

class CoffeeShop {
    var shopName: String
    var employeeNumber: Int
    var revenue: Int = 0
    var barista: Person
    var customer: Person?
    var menu: Dictionary<Coffee, Int> = [.americano : 2000, .espresso : 2500, .cafeLatte : 3000, .cafeMoca : 3500, .vanilaLatte : 4000]
    
    struct pickUpTable {
        var pickUpCoffee: Coffee?
        var isExist: Bool = false
    }
    
    init(shopName: String, employeeNumber: Int, barista: Person) {
        self.shopName = shopName
        self.employeeNumber = employeeNumber
        self.barista = barista
    }
    
    func order(_ coffee: Coffee) {
        if let coffeeCost = menu[coffee] {
            self.revenue += coffeeCost
            makeCoffee(what: coffee)
        } else {
            print("메뉴가 존재하지 않습니다.")
        }
    }
    
    func makeCoffee(what coffee: Coffee) {
        if let customer = customer {
            print("\(customer.name) 님의 \(coffee)를 만듭니다.")
        } else {
            print("손님이 없습니다.")
        }
        
        let pickupCoffee = pickUpTable(pickUpCoffee: coffee, isExist: true)
        if let pickupCoffee = pickupCoffee.pickUpCoffee {
            giveCoffee(with: pickupCoffee)
        } else {
            print("픽업대에 커피가 없습니다.")
        }
    }
    
    func giveCoffee(with coffee: Coffee) {
        if let customer = customer {
            print("\(customer.name) 님의 \(coffee)가 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
}

enum Coffee {
    case americano
    case espresso
    case cafeLatte
    case cafeMoca
    case vanilaLatte
}

var misterLee = Person(name: "misterLee", age: 20, gender: .male, money: 10000)
var missKim = Person(name: "missKim", age: 20, gender: .female, money: 15000)
var yagombucks = CoffeeShop(shopName: "yagombucks", employeeNumber: 5, barista: misterLee)

missKim.placeOrder(with: .americano, to: yagombucks)
