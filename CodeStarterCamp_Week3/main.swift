//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person: CoffeeShop {
    var money: Int
    var name: String
    
    init(money: Int, name: String) {
        self.money = money
        self.name = name
        super.init(yagombucks: misterLee, sales: 0, menu: [:], pickUpTable: [], barista: misterLee)
    }
    func makePayment(coffee: Coffee, person: Person) {
        if let price = menu[coffee] {
            if price <= person.money {
                person.money -= price
                print("거스름돈은 \(person.money)원 입니다.")
            }
            else if price > person.money {
                print("잔액이 \(price-person.money)원만큼 부족합니다.")
            }
        }
    }
}

class CoffeeShop {
    var menu: [Coffee: Int]
    var pickUpTable: Array<String> = Array<String>()
    var barista: Person
    var sales: Int
    var yagombucks: CoffeeShop
    
    init(yagombucks: CoffeeShop, sales: Int, menu: [Coffee: Int], pickUpTable: Array<String>, barista: Person) {
        self.menu = [.americano: 3000, .cafeLatte: 3500, .coldBrew: 4000]
        self.pickUpTable = pickUpTable
        self.barista = barista
        self.sales = sales
        self.yagombucks = yagombucks
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
        var sumSales: Int = 0
        if let price = menu[price] {
            sumSales += price
            sales = sumSales
        }
        print("yagombucks의 매출이 \(sales)원 올랐습니다.")
    }
}

var misterLee: Person = Person(money: 10000, name: "misterLee")
var missKim: Person = Person(money: 10000, name: "missKim")
var pickUpTable: Array<String> = Array<String>()

func order(coffee: CoffeeShop.Coffee, person: Person, pickUpTable: Array<String>, price: CoffeeShop.Coffee) {
    missKim.yagombucks.orderMenu(coffee: coffee)
    missKim.makePayment(coffee: coffee, person: person)
    missKim.yagombucks.goingUp(price: coffee)
    missKim.yagombucks.makeCoffee(coffee: coffee)
    missKim.yagombucks.putOn(pickUpTable: pickUpTable, person: person, coffee: coffee)
}
order(coffee: CoffeeShop.Coffee.americano, person: missKim, pickUpTable: pickUpTable, price: .americano)
