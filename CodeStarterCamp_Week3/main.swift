//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

 
enum Coffee: String {
    case americano = "아메리카노"
    case cafeLatte = "카페라떼"
    case cappuccino = "카푸치노"
    case mocha = "모카"
    case prapucihno = "프라푸치노"
    case banillaLatte = "바닐라라떼"
}

struct Person {
    var money: Int
    var name: String
    func buyCoffee(coffee: Coffee) {
        print("\(coffee.rawValue)를 구매합니다.")
    }
}

class CoffeeShop {
    var sales: Int
    var barista: Person
    var menu: [Coffee: Int]
    var pickUpTable: [String]
    
    init(sales: Int, barista: Person, menu: [Coffee: Int], pickUpTable: [String]) {
        self.sales = sales
        self.barista = barista
        self.menu = menu
        self.pickUpTable = pickUpTable
    }
    
    func takeOrder(coffee: Coffee) {
        print("\(coffee.rawValue)의 주문이 들어왔습니다.")
        print("\(barista.name) 바리스타가 주문을 진행합니다.")
    }
    
    func makeCoffee(coffee: Coffee) {
        print("커피를 다 만들었습니다.")
        pickUpTable.append(coffee.rawValue)
        
    }
    
}

var menu: [Coffee: Int] = [.americano: 1000, .cafeLatte: 1500, .cappuccino: 1500]
var pickUpTable: [String] = []

var misterLee: Person = Person(money: 2000, name: "이철호")
var missKim: Person = Person(money: 1500, name: "김숙희")
var yagombuks: CoffeeShop = CoffeeShop(sales: 10000, barista: misterLee, menu: menu, pickUpTable: pickUpTable)

yagombuks.takeOrder(coffee: .americano)




