//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var money: Int
    var name: String
    
    init(money: Int, name: String) {
        self.money = money
        self.name = name
    }
}

class CoffeeShop {
    var menu: [Coffee: Int]
    var pickUpTable: Array<String> = Array<String>()
    var barista: Person
    var sales: Int
//    var yagombucks: CoffeeShop
    
    init(sales: Int, menu: [Coffee: Int], pickUpTable: Array<String>, barista: Person) {
        self.menu = [.americano: 3000, .cafeLatte: 3500, .coldBrew: 4000]
        self.pickUpTable = pickUpTable
        self.barista = barista
        self.sales = sales
    }
    
    enum Coffee {
        case americano, cafeLatte, coldBrew
    }
    
    func orderMenu(coffee: Coffee) {
        print("\(coffee)한잔 주문 받았습니다.")
    }
    
    func makeCoffee(coffee: Coffee) {
        print("\(coffee)를 만들었습니다.")
    }
    
    func putOn(pickUpTable: Array<String>, person: Person, coffee: Coffee) {
        let PickUpTable = "\(coffee)"
        print(PickUpTable)
        print("\(person.name)님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
    }
    
    func goingUp(price: Coffee) {
        if let price = menu[price] {
            sales += price
        }
        print("yagombucks의 매출이 \(sales)원 올랐습니다.")
    }
    
    func makePayment(coffee: Coffee, person: Person) {
        if let price = menu[coffee] {
            if price <= person.money {
                person.money -= price
                print("거스름돈은 \(person.money)원 입니다.")
            } else if price > person.money {
                print("잔액이 \(price-person.money)원만큼 부족합니다.")
            }
        }
    }
    
    func order(coffee: CoffeeShop.Coffee, person: Person, pickUpTable: Array<String>, price: CoffeeShop.Coffee) {
        yagombucks.orderMenu(coffee: coffee)
        yagombucks.makePayment(coffee: coffee, person: person)
        yagombucks.goingUp(price: coffee)
        yagombucks.makeCoffee(coffee: coffee)
        yagombucks.putOn(pickUpTable: pickUpTable, person: person, coffee: coffee)
}
}
var yagombucks:CoffeeShop = CoffeeShop(sales: 0, menu: [:], pickUpTable: [], barista: misterLee)
var misterLee: Person = Person(money: 10000, name: "misterLee")
var missKim: Person = Person(money: 10000, name: "missKim")
var pickUpTable: Array<String> = Array<String>()
    
yagombucks.order(coffee: .americano, person: missKim, pickUpTable: pickUpTable, price: .americano)
