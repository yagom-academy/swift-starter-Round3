//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    let name: String
    let gender: String
    var age: Int
    var money: Int
    
    init(name: String, gender: String, age: Int, money: Int) {
        self.name = name
        self.gender = gender
        self.age = age
        self.money = money
    }
    
    func order(coffee: Coffee, shopName: CoffeeShop) {
        if let price = shopName.menu[coffee] {
            money -= price
        } else {
            print("메뉴를 찾을 수 없습니다.")
        }
        print("\(name)가 \(coffee.rawValue)를 구매합니다.")
        print("남은 돈 \(money)입니다.")
        shopName.takeOrder(coffee: coffee)
    }
    
    func leave(shopName: CoffeeShop) {
        print("\(name)가 \(shopName.shopName) 떠납니다.")
    }
    
}

class CoffeeShop {
    let shopName: String
    var sales: Int
    var barista: Person
    var pickUpTable = [Coffee]()
    var menu: [Coffee: Int] = [Coffee.americano: 4100, Coffee.cafeLatte: 4600, Coffee.caramelMacchiato: 5600]
    
    init(shopName: String, sales: Int, barista: Person) {
        self.shopName = shopName
        self.sales = sales
        self.barista = barista
    }
    
    func takeOrder(coffee: Coffee) {
        print("\(coffee.rawValue) 주문 받았습니다.")
        if let price = menu[coffee] {
            sales += price
        } else {
            print("메뉴를 찾을 수 없습니다.")
        }
        make(coffee)
        print("현재 매출액 \(sales)원입니다.")    }
    
    func make(_ coffee: Coffee) {
        print("\(coffee.rawValue) 준비되었습니다.")
    }
}

enum Coffee: String {
    case americano = "아메리카노", cafeLatte = "카페 라떼", caramelMacchiato = "카라멜 마끼아또"
}

let misterLee: Person = Person(name: "Mr. Lee", gender: "male", age: 40, money: 20000)
let missKim: Person = Person(name: "Ms. Kim", gender: "female", age: 25, money: 50000)
let yagombucks: CoffeeShop = CoffeeShop(shopName: "YAGOMBUCKS", sales: 0, barista: misterLee)

missKim.order(coffee: Coffee.cafeLatte, shopName: yagombucks)
