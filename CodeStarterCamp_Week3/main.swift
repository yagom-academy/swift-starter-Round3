//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee {
    case americano
    case latte
    case cappucino
    case espresso
}

class CoffeeShop {
    var sales: Int
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee]
    
    init(sales: Int, menu: [Coffee: Int]) {
        self.sales = sales
        self.menu = menu
        self.pickUpTable = []
    }
    func takeOrder(order: Coffee) {
        if let price = menu[order], sales >= price {
            pickUpTable.append(order)
            sales -= price
            print("주문 받았습니다: \(order)")
        } else {
            print("주문이 실패했습니다: \(order)")
        }
    }
    func makeCoffee(barista: Person) {
        guard let order = pickUpTable.first else {
            print("테이블에 주문이 없습니다.")
            return
        }
        let coffee = order
        barista.getCoffee(coffee)
        pickUpTable.removeFirst()
        print("커피가 제조되었습니다.: \(coffee)")
    }
}

class Person {
    var money: Int
    init(money: Int) {
        self.money = money
    }
    func buyCoffee(from cafe: CoffeeShop, order: Coffee) {
        cafe.takeOrder(order: order)
    }
    func getCoffee(_ coffee: Coffee) {
        print("커피를 받았습니다.: \(coffee)")
    }
}

var misterLee = Person(money: 100)
var missKim = Person(money: 50)


var yahomvucks = CoffeeShop(sales: 1000, menu: [.americano:100, .latte: 200, .cappucino: 250, .espresso: 150])

yahomvucks.makeCoffee(barista: misterLee)
misterLee.buyCoffee(from: yahomvucks, order: .latte)
yahomvucks.makeCoffee(barista: misterLee)
