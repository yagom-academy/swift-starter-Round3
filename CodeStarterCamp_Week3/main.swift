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
    case latte = "라떼"
    case mocha = "모카"
    case macchiato = "마끼아또"
    
    func price() -> Int {
        switch self {
        case .americano: return 4000
        case .latte: return 4500
        case .mocha: return 4500
        case .macchiato: return 5000
        }
    }
}

struct Person {
    let name: String
    var money: Int
    
    func selectMenu(coffee: Coffee) {
        print("선택하신 메뉴는 \(coffee)입니다.")
    }
    
    func payMoney(amount: Int) {
        print("돈을 \(amount)원 지불합니다.")
    }
    
    func pickUp() {
        print("주문한 메뉴를 픽업합니다.")
    }
}

struct CoffeeShop {
    var sales: Int
    var menuPan: Dictionary<Coffee, Int> = [:]
    var barista: Person
    var orderQueue: (who: Person, menu: Coffee)?
    var pickUpTable: Array<Coffee>?
    
    init(sales: Int, barista: Person) {
        self.sales = sales
        self.barista = barista
    }
    
    mutating func employBarista(who: Person) {
        barista = who
    }
    
    mutating func addMenu(what: Coffee) {
        menuPan[what] = what.price()
    }
    
    mutating func takeOrder(from: Person, menu: Coffee) {
        print("\(from)님이 주문하신 메뉴는\(menu.rawValue)입니다.")
        print("가격은 \(menu.price())입니다.")
        orderQueue = (from, menu)
    }
    
    mutating func takeMoney(from: Person, amount: Int) {
        if let orderQueue = orderQueue {
            print("\(orderQueue.menu.price())원 받았습니다.")
            sales += amount
        } else {
            print("먼저 주문을 해주십시오.")
        }
    }
    
    func makeOrderedMenu() {
        if let orderQueue = orderQueue {
            print("\(orderQueue.menu.rawValue)메뉴를 만듭니다.")
        } else {
            print("먼저 주문을 해주십시오.")
        }
    }
    
    func putDownOrderedMenu() {
        if let orderQueue = orderQueue {
            print("\(orderQueue.who)님이 주문하신 \(orderQueue.menu.rawValue)메뉴가 픽업대에 준비되었습니다.")
        }
    }
}

var misterLee: Person = Person(name: "misterLee", money: 0)
var missKim: Person = Person(name: "missKim", money: 10000)

var yagomBucks: CoffeeShop = CoffeeShop(sales: 0, barista: misterLee)
