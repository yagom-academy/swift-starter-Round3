//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var money: Int
    
    func buyCoffee(what coffee: Coffee, for amount: Int) -> Dictionary<Coffee, Int> {
        let purchase = [coffee: amount]
        return purchase
    }
}

struct CoffeeShop {
    var sales: Int
    var coffeePrice: Dictionary<Coffee, Int> = [Coffee: Int]()
    var pickUpTable: Array<Coffee> = [Coffee]()
    var barista: Person?
    
    func takeOrder(who: Person, order: [Coffee: Int]) -> [Coffee: Int] {
        // who.money -= Coffee.~~의 가격 * 수량 int
        // self.sales +=            "
        return order
    }
    func makeCoffee(orderedCoffee: [Coffee: Int]) {
        // 딕셔너리형태말고 배열로 담기.
        // for _ in 1...amount
        //      .append()
    }
    
}

enum Coffee {
    case americano, latte, cappuccino

    var price: Int {
        get {
            switch self {
            case .americano:
                return 3
            case .latte:
                return 4
            case .cappuccino:
                return 5
            }
        }
    }
}

var misterLee = Person(money: 100)
var missKim = Person(money: 150)

var yagombucks = CoffeeShop(sales: 10000, coffeePrice: [:], pickUpTable: [])
yagombucks.barista = misterLee

// --- 여기부턴 testing
var yagomCoffeePrice: Dictionary<Coffee, Int> = [Coffee: Int]()
yagomCoffeePrice[Coffee.americano] = 3
yagomCoffeePrice[Coffee.latte] = 4
yagomCoffeePrice[Coffee.cappuccino] = 5
