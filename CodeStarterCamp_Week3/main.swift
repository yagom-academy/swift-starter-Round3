//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee: CaseIterable {
    case americano
    case latte
    case espresso
    
    var price: Int {
        switch self {
        case .espresso:
            return 3800
        case .americano:
            return 4100
        case .latte:
            return 4500
        }
    }
}

class Person {
    let name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(coffee: Coffee, from coffeeShop: CoffeeShop) {
        let hasEnoughMoney = self.money >= coffee.price
        guard hasEnoughMoney else {
            self.money -= coffee.price
            print("잔액이 \(-self.money)원만큼 부족합니다.")
            return
        }
        self.money -= coffee.price
        print("결제가 완료되었습니다. 잔액은 \(self.money)원입니다.")
        coffeeShop.takeOrder(coffee: coffee, from: self)
    }
}

var misterLee = Person(name: "misterLee", money: 10000)
var missKim = Person(name: "missKim", money: 10000)

class CoffeeShop {
    var sales: Int
    let menu: [Coffee: Int]
    var pickUpTable: Bool
    let barista: Person
    
    init(sales: Int, menu: [Coffee: Int], pickUpTable: Bool, barista: Person) {
        self.sales = sales
        self.menu = menu
        self.pickUpTable = pickUpTable
        self.barista = barista
    }

    func takeOrder(coffee: Coffee, from person: Person) {
        sales += coffee.price
        pickUpTable = true
        makeCoffee(coffee: coffee, to: person, on: pickUpTable)
    }
    
    func makeCoffee(coffee: Coffee, to person: Person, on pickUpTable: Bool) {
        let isCompleted = pickUpTable == true
        if isCompleted {
            print("\(person.name)님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
        } else {
            print("잠시만 기다려주세요")
        }
    }
}

var yagombucks = CoffeeShop(sales: 0, menu: [Coffee.espresso: Coffee.espresso.price, Coffee.americano: Coffee.americano.price, Coffee.latte: Coffee.latte.price], pickUpTable: false, barista: misterLee)

missKim.buy(coffee: Coffee.americano, from: yagombucks)
