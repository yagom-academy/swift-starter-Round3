//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by Wonbi on 2022/05/09.
//

import Foundation

struct CoffeeShop {
    var salesRevenue: Int = 0
    let menuPlate: Dictionary<Coffee, Int> = [.americano: 4000, .latte: 4500, .mocha: 4500, .macchiato: 5000]
    var barista: Person
    var orderList: (menu: Coffee, price: Int) = (.none, 0)
    var isOrderReady: Bool = false {
        willSet {
            if !isOrderReady {
                print("메뉴 완성!")
            }
        }
    }
    
    init(barista: Person) {
        self.barista = barista
    }
    
    mutating func order(from orderer: Person) {
        takeMoney()
        makeCoffee()
        tellOrderIsReady(to: orderer)
    }
    
    mutating func checkMenu(orderer: Person, menu: Coffee) {
        if let payment = menuPlate[menu] {
            print("\(orderer.name)님이 주문하신 메뉴는 \(menu.rawValue)입니다. 가격은 \(payment)입니다.")
            orderList = (menu, payment)
        } else {
            print("없는 메뉴입니다.")
        }
    }
    
    mutating func takeMoney() {
        print("\(orderList.price)원 받았습니다.")
        salesRevenue += orderList.price
    }
    
    mutating func makeCoffee() {
        print("\(self.barista.name) 바리스타가 \(orderList.menu.rawValue) 메뉴를 만듭니다.")
        isOrderReady = true
    }
    
    mutating func tellOrderIsReady(to orderer: Person) {
        print("\(orderer.name)님이 주문하신 \(orderList.menu.rawValue) 메뉴가 준비되었습니다. 픽업대에서 가져가주세요.")
        orderList = (.none, 0)
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case latte = "라떼"
    case mocha = "모카"
    case macchiato = "마끼아또"
    case none = "없음"
}
