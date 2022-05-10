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
        if let myMenu  = coffeeShop.menu[coffee] {
            self.money = self.money - myMenu
            self.money < 0 ? print("잔액이 \(self.money)원만큼 부족합니다") : coffeeShop.order(coffee, who: self.name)
        }
    }
}

class CoffeeShop {
    var shopName: String
    var employeeNumber: Int
    var revenue: Int = 0
    var barista: Person
    
    struct pickUpTable {
        var pickUpCoffee: Coffee?
        var isExist: Bool?
    }

    init(shopName: String, employeeNumber: Int, barista: Person) {
        self.shopName = shopName
        self.employeeNumber = employeeNumber
        self.barista = barista
    }
    
    var menu: Dictionary<Coffee, Int> = [.americano : 2000, .espresso : 2500, .cafeLatte : 3000, .cafeMoca : 3500, .vanilaLatte : 4000]
    
    func order(_ coffee: Coffee, who person: String) {
        if let coffeeCost = menu[coffee] {
            self.revenue += coffeeCost
            makeCoffee(what: coffee, who: person)
        } else {
            print("메뉴가 존재하지 않습니다.")
        }
    }
    
    func makeCoffee(what coffee: Coffee, who person: String) {
        print("\(person) 님의 \(coffee)를 만듭니다.")
        
        let pickupCoffee = pickUpTable(pickUpCoffee: coffee, isExist: true)
        pickupCoffee.isExist == true ? giveCoffee(to: person, with: coffee) : print("픽업테이블에 \(coffee)가 존재하지 않습니다.")
    }
    
    func giveCoffee(to customer: String, with coffee: Coffee) {
        print("\(customer) 님의 \(coffee)가 준비되었습니다. 픽업대에서 가져가주세요.")
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
