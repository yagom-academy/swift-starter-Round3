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
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }

    func buy(_ coffee: Coffee, at coffeeShop: CoffeeShop) {
        coffeeShop.customer?.name = name
        coffeeShop.order(coffee)
    }
}

class Barista: Person {
    var coffeeReady = false
    
    func makeCoffee() {
        coffeeReady = true
    }
}

class CoffeeShop {
    var sales: Int = 0
    let menuList: [Coffee: Int] = [.americano: 4000, .latte: 4500, .milkTea: 4500, .vanillaLatte: 5000, .strawberryLatte: 5500]
    var pickUpTable: Bool = false
    var barista: Barista?
    var customer: Person?
    
    func order(_ coffee: Coffee) {
        if let worker = barista, let buyer = customer, let coffeePrice = menuList[coffee] {
            if buyer.money < coffeePrice {
                print("잔액이 \(coffeePrice - buyer.money)원만큼 부족합니다. ")
            } else {
                buyer.money -= coffeePrice
                worker.makeCoffee()
                pickUpTable = worker.coffeeReady
                giveCoffee(to: buyer.name)
            }
            sales += coffeePrice
            pickUpTable = false
        }
    }
    
    func giveCoffee(to customer: String) {
        if pickUpTable == true {
            print("\(customer) 님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
}

enum Coffee {
    case americano, latte, milkTea, vanillaLatte, strawberryLatte
}

var missKim = Person(name: "missKim", money: 13000)
let misterLee = Barista(name: "misterLee", money: 10000)
var yagombucks = CoffeeShop()
yagombucks.barista = misterLee
yagombucks.customer = missKim

missKim.buy(.strawberryLatte, at: yagombucks)
missKim.buy(.americano, at: yagombucks)
missKim.buy(.milkTea, at: yagombucks)
