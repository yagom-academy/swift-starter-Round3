//
//  step2.swift
//  CodeStarterCamp_Week3
//
//  Created by smfc on 8/7/2022.
//

import Foundation

enum Coffee: Int {
    case espresso = 3800
    case americano = 4200
    case latte = 4500
    case cappuccino = 5100
    case mocha = 5600
    case todaysCoffee = 4600
    case herbTea = 3500
    
    var name: String {
        switch self {
        case .espresso:
            return "에스프레소"
        case .americano:
            return "아메리카노"
        case .latte:
            return "라떼"
        case .cappuccino:
            return "카푸치노"
        case .mocha:
            return "카페모카"
        case .todaysCoffee:
            return "오늘의 커피"
        case .herbTea:
            return "허브티"
        }
    }
}

struct Person {
    var name: String
    var age: Int
    var height: Double?
    var moneyAmount: Int
    
    mutating func order(_ coffee: Coffee) {
        let drinkPrice = coffee.rawValue
        let coffeeName = coffee.name
        
        if moneyAmount >= drinkPrice {
            print("\(coffeeName)를 \(drinkPrice)원에 구입합니다, ", terminator: "")
            self.moneyAmount = moneyAmount - drinkPrice
            print("남은 돈: \(self.moneyAmount)원")
            yagombucks.make(coffee, from: self.name)
            yagombucks.salesAmount += drinkPrice
        }
        else {
            print("잔액이 \(drinkPrice - moneyAmount)원 만큼 부족합니다.")
        }
    }
}

var misterLee: Person = Person(name: "misterLee", age: 20, height: 176.8, moneyAmount: 3500)
var missKim: Person = Person(name: "missKim", age: 24, moneyAmount: 20000)
var coda: Person = Person(name: "Coda", age: 50, moneyAmount: 1000000)

struct CoffeeShop {
    var name: String
    var barista: Person?
    var salesAmount: Int
    var pickUpTable: Array<Coffee> = []
    
    mutating func make(_ coffee: Coffee, from name: String) {
        pickUpTable.append(coffee)
        let coffeeName = coffee.name
        print("\(name)님이 주문하신 \(coffeeName)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

var yagombucks: CoffeeShop = CoffeeShop(name: "yagomBucks", barista: misterLee, salesAmount: 10000000)
