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
    
    func order(_ coffee: Coffee, _ shop: CoffeeShop) {
        print("\(name)님이 \(coffee.rawValue)(을/를) 구매합니다.")
        
        if let price = shop.menu[coffee] {
            money -= price
        } else {
            print("메뉴를 찾을 수 없습니다.")
        }
        
        guard money > 0 else {
            return print("잔액이 \(-money)원만큼 부족합니다.")
        }

        print("\(name)님의 남은 돈은 \(money)원입니다.")
        shop.make(coffee, from: name)
    }
    
    func leave(_ shop: CoffeeShop) {
        print("\(name)님이 \(shop.shop)(을/를) 떠납니다.")
    }
    
}

class CoffeeShop {
    let shop: String
    var sales: Int
    var barista: Person
    var customer: String = "손님 없음"
    var pickUpCoffee: String = "커피 없음"
    var pickUpTable = [Coffee]() {
        didSet {
            print("\(customer)님이 주문하신 \(pickUpCoffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
    var menu: [Coffee: Int] = [Coffee.americano: 4100, Coffee.cafeLatte: 4600, Coffee.caramelMacchiato: 5600]
    
    init(shop: String, sales: Int, barista: Person) {
        self.shop = shop
        self.sales = sales
        self.barista = barista
    }
    
    func make(_ coffee: Coffee, from name: String) {
        print("\(coffee.rawValue) 주문 받았습니다.")
        
        if let price = menu[coffee] {
            sales += price
        } else {
            print("메뉴를 찾을 수 없습니다.")
        }
        
        print("현재 \(shop)의 매출액은 \(sales)원입니다.")
        customer = name
        pickUpCoffee = coffee.rawValue
        pickUpTable.append(coffee)
    }
}

enum Coffee: String {
    case americano = "아메리카노", cafeLatte = "카페 라떼", caramelMacchiato = "카라멜 마끼아또"
}

let misterLee: Person = Person(name: "Mr. Lee", gender: "male", age: 40, money: 2900)
let missKim: Person = Person(name: "Ms. Kim", gender: "female", age: 25, money: 10000)
let yagombucks: CoffeeShop = CoffeeShop(shop: "YAGOMBUCKS", sales: 0, barista: misterLee)

missKim.order(Coffee.cafeLatte, yagombucks)
misterLee.order(Coffee.americano, yagombucks)
misterLee.leave(yagombucks)
