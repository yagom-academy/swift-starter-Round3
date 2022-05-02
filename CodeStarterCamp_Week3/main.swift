//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    var money: Int
    
    func buy(_ coffee: Coffee, at coffeeShop: CoffeeShop) {
        coffeeShop.order(coffee)
    }
}

class CoffeeShop {
    var sales: Int = 0
    let menuList: [Coffee: Int] = [.americano: 4000, .latte: 4500, .milkTea: 4500, .vanillaLatte: 5000, .strawberryLatte: 5500]
    var barista: Person
    var customer: Person?
    var pickUpTable: Bool = false {
        didSet {
            if let buyer = customer, pickUpTable == true {
                print("\(buyer.name) 님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
                pickUpTable = false
            }
        }
    }
    
    init(barista: Person) {
        self.barista = barista
    }
    
    func order(_ coffee: Coffee) {
        if let coffeePrice = menuList[coffee], let buyer = customer {
            if buyer.money < coffeePrice {
                print("잔액이 \(coffeePrice - buyer.money)원만큼 부족합니다.")
            } else {
                makeCoffee()
                calculate(coffeePrice)
            }
        }
    }
    
    func makeCoffee() {
        print("\(barista.name)이(가) 커피를 만들었습니다.")
        pickUpTable = true
    }
    
    func calculate(_ price: Int) {
        customer?.money -= price
        sales += price
    }
}

enum Coffee {
    case americano, latte, milkTea, vanillaLatte, strawberryLatte
}

var missKim = Person(name: "missKim", money: 12000)
let misterLee = Person(name: "misterLee", money: 10000)
var yagombucks = CoffeeShop(barista: misterLee)
yagombucks.customer = missKim

missKim.buy(.strawberryLatte, at: yagombucks)
missKim.buy(.americano, at: yagombucks)
missKim.buy(.milkTea, at: yagombucks)
