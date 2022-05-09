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
}

struct Person {
    let name: String
    var money: Int
    var payment: Int = 0
    
    mutating func selectMenu(where coffeeShop: CoffeeShop, coffee: Coffee) {
        if let orderedMenuPrice = coffeeShop.menuPlate[coffee] {
            print("선택하신 메뉴는 \(coffee)입니다. 가격은 \(orderedMenuPrice)원 입니다.")
            payment += orderedMenuPrice
        } else {
            print("가게가 아직 판매 준비를 끝내지 않았습니다.")
        }
    }
    
    mutating func payMoney() {
        if payment != 0 {
            print("돈을 \(payment)원 지불합니다.")
            money -= payment
            print("수중에 남은 돈은 \(money)원 입니다.")
            self.payment = 0
        } else {
            print("메뉴를 먼저 고르십시오.")
        }
    }
    
    func pickUp(where coffeeShop: CoffeeShop) {
        if let _ = coffeeShop.pickUpTable {
            print("주문한 메뉴를 픽업합니다.")
        } else {
            print("메뉴가 아직 준비되지 않았습니다.")
        }
    }
}

struct CoffeeShop {
    var salesRevenue: Int = 0
    var menuPlate: Dictionary<Coffee, Int> = [:]
    var barista: Person
    var orderQueue: (who: Person, menu: Coffee)?
    var pickUpTable: Coffee? = nil
    
    init(barista: Person) {
        self.barista = barista
    }
    
    mutating func settingPrice(menu: Coffee..., price: Int...) {
        if menu.count == price.count {
            for index in 0..<menu.count {
                menuPlate[menu[index]] = price[index]
            }
        } else {
            print("메뉴의 갯수와 가격의 갯수가 일치하지 않습니다.")
        }
    }
    
    mutating func takeOrder(from person: Person, menu: Coffee) {
        orderQueue = (person, menu)
        if let orderedMenuPrice = menuPlate[menu] {
            print("\(person.name)님이 주문하신 메뉴는 \(menu.rawValue)입니다. 가격은 \(orderedMenuPrice)입니다.")
        }
    }
    
    mutating func takeMoney() {
        if let orderQueue = orderQueue {
            if let orderedMenuPrice = menuPlate[orderQueue.menu] {
                print("\(orderedMenuPrice)원 받았습니다.")
                salesRevenue += orderedMenuPrice
            }
        } else {
            print("먼저 주문을 해주십시오.")
        }
    }
    
    func makeOrderedMenu() {
        if let orderQueue = orderQueue {
            print("\(orderQueue.menu.rawValue) 메뉴를 만듭니다.")
        } else {
            print("먼저 주문을 해주십시오.")
        }
    }
    
    mutating func putDownOrderedMenu() {
        if let orderQueue = orderQueue {
            print("\(orderQueue.who.name)님이 주문하신 \(orderQueue.menu.rawValue) 메뉴가 픽업대에 준비되었습니다.")
            pickUpTable = orderQueue.menu
        } else {
            print("먼저 주문을 해주십시오.")
        }
    }
}

var misterLee: Person = .init(name: "misterLee", money: 0)
var missKim: Person = .init(name: "missKim", money: 10000)
var yagomBucks: CoffeeShop = .init(barista: misterLee)

yagomBucks.settingPrice(menu: .americano, .latte, .mocha, .macchiato, price: 4000, 4500, 4500, 5000)

missKim.selectMenu(where: yagomBucks, coffee: .americano)
yagomBucks.takeOrder(from: missKim, menu: .americano)
missKim.payMoney()
yagomBucks.takeMoney()
yagomBucks.makeOrderedMenu()
yagomBucks.putDownOrderedMenu()
missKim.pickUp(where: yagomBucks)
