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
    var age: UInt
    var money: Int
    
    init?(name: String, age: UInt, money: Int) {
        if (0...100).contains(age) == false || name.isEmpty {
            return nil
        }
        self.name = name
        self.age = age
        self.money = money
    }
    
    func order(_ coffee: CoffeeShop.Coffee, of coffeeShop: CoffeeShop, by name: String) {
        if self.money < coffee.rawValue {
            let insufficientFunds = coffee.rawValue - self.money
            print ("잔액이 \(insufficientFunds)만큼 부족합니다.")
        } else {
            coffeeShop.make(_ : coffee, from: name)
            self.money = money - coffee.rawValue
        }
    }
}

class CoffeeShop {
    
    var name: String
    var barista: Person!
    var revenue: Int
    var pickUpTable: Array<String> = [] {
        didSet {
            print("\(name)님이 주문하신 \(pickUpTable.last ?? "준비되지 않았습니다.")(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
    
    enum Coffee: Int {
        case americano = 1500
        case latte = 3500
        case espresso = 1000
    }
    
    init(name: String, barista: Person?, revenue: Int) {
        self.name = name
        self.barista = barista
        self.revenue = revenue
    }
       
    func make(_ coffee: Coffee, from name: String) {
        self.revenue += coffee.rawValue
        self.pickUpTable.append(String(describing: coffee))
    }
}
    

guard let missKim: Person = Person(name: "missKim", age: 23, money: 1000) else {
    fatalError("Person missKim initializing failed")
}
guard let misterLee: Person = Person(name: "misterLee", age: 30, money: 1500) else {
    fatalError("Person misterLee initializing failed")
}
let yagombucks: CoffeeShop = CoffeeShop(name:"yagombucks", barista: misterLee, revenue: 0)
missKim.order(.latte, of: yagombucks, by: missKim.name)
missKim.order(.espresso, of: yagombucks, by: missKim.name)

