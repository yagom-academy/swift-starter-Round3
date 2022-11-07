//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// MARK: Person 타입 정의

class Person {
    var name: String
    var age: Int
    var money: Int
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    
    func selfIntroduce() {
        print("제 이름은 \(name)이고 \(age)살 입니다. 소지금은 \(money)입니다.")
    }
    
    func orderCoffee(_ coffee: Coffee, at coffeeShop: CoffeeShop) {
        if money >= coffee.price {
            print("\(name) 님이 \(coffee.rawValue)를 주문합니다.")
            money = money - coffee.price
            coffeeShop.makeCoffee(_: coffee, from: name)
        } else {
            print("\(name)님의 잔액이 \(coffee.price - money)원만큼 부족합니다")
        }
    }
}

// MARK: CoffeeShop 타입 정의
class CoffeeShop {
    let cafeName: String
    var revenue: Int = 0
    var menu: Dictionary<Coffee, Int> = [:]
    var pickUpTable: Array<Coffee> = [] {
        didSet {
            if let orderedCoffee = orderedCoffee {
                print("\(customer)님이 주문하신 \(orderedCoffee.rawValue)가 준비되었습니다.")
            }
        }
        
    }
    
    var barista: Person?
    var customer: String = ""
    var orderedCoffee: Coffee?
    
    init(cafeName: String, barista: Person? = nil) {
        self.cafeName = cafeName
        self.barista = barista
        self.revenue = 0
        self.menu = menuUpdate()
        self.pickUpTable = []
    }
    
    func selfIntroduce() {
        if let barista = barista {
            print("어서오세요 \(cafeName)입니다. 바리스타 \(barista.name)라고 합니다.")
        } else {
            print("어서오세요 \(cafeName)입니다.")
        }
    }
    
    func takeOrder(coffee: Coffee){
        print("\(cafeName)에서 \(coffee.rawValue)를 주문받았습니다.")
    }
    
    func makeCoffee(_ coffee: Coffee, from name: String) {
        customer = name
        orderedCoffee = coffee
        revenue += coffee.price
        pickUpTable.append(coffee)
    }
    
    func menuUpdate() -> Dictionary<Coffee, Int> {
        var coffeeList = Coffee.allCases
        for coffee in coffeeList {
            menu[coffee] = coffee.price
        }
        return menu
    }
}


// MARK: Coffee 타입(열거형) 정의
enum Coffee: String ,CaseIterable {
    case americano = "아메리카노"
    case espresso = "에스프레소"
    case cafeLatte = "카페라떼"
    case cafeMocha = "카페모카"
    case vanillaLatte = "바닐라라떼"
    case cappuccino = "카푸치노"
    case affogato = "아포가토"
    case caramelMacchiato = "카라멜마끼아또"
    
    var price: Int {
        switch self {
        case .americano:
            return 4000
        case .espresso:
            return 3500
        case .cafeLatte:
            return 4500
        case .cafeMocha:
            return 4500
        case .vanillaLatte:
            return 4800
        case .cappuccino:
            return 5000
        case .affogato:
            return 5300
        case .caramelMacchiato:
            return 5500
        }
    }
}

// MARK: 출력
var missKim = Person(name: "김미스", age: 30, money: 30000)
var misterLee = Person(name: "이미스터", age: 26, money: 2000)

var yagombucks = CoffeeShop(cafeName: "야곰벅스")

missKim.orderCoffee(_: .vanillaLatte, at: yagombucks)
misterLee.orderCoffee(_: .caramelMacchiato, at: yagombucks)
