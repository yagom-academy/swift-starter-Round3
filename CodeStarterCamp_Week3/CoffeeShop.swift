//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by Wonbi on 2022/05/09.
//

import Foundation

class CoffeeShop {
    var salesRevenue: Int = 0
    var menuPlate: Dictionary<Coffee, Int> = [:]
    var barista: Person
    var orderList: (Person, Coffee)?
    var pickUpTable: Bool = false {
        willSet {
            if !pickUpTable {
                print("메뉴 완성!")
            }
        }
        didSet {
            if pickUpTable {
                if let orderList = orderList {
                    putDownOrderedMenu(from: orderList)
                    self.orderList = nil
                }
            }
        }
    }
    
    init(barista: Person) {
        self.barista = barista
    }
    
    func order(_ coffee: Coffee, who person: Person) {
        orderList = (person, coffee)
        if let orderList = orderList {
            takeMoney(from: orderList)
            makeOrderedMenu(from: orderList)
        } else {
            print("먼저 주문을 해주십시오.")
        }
    }
    
    func settingPrice(menu: Coffee..., price: Int...) {
        if menu.count == price.count {
            for index in 0..<menu.count {
                menuPlate[menu[index]] = price[index]
            }
        } else {
            print("메뉴의 갯수와 가격의 갯수가 일치하지 않습니다.")
        }
    }
    
    func takeMoney(from orderList: (Person, Coffee)) {
        if let orderedMenuPrice = menuPlate[orderList.1] {
            print("\(orderedMenuPrice)원 받았습니다.")
            salesRevenue += orderedMenuPrice
        }
    }
    
    func makeOrderedMenu(from orderList: (Person, Coffee)) {
        print("\(self.barista.name) 바리스타가 \(orderList.1.rawValue) 메뉴를 만듭니다.")
        pickUpTable = true
    }
    
    func putDownOrderedMenu(from orderList: (Person, Coffee)) {
        print("\(orderList.0.name)님이 주문하신 \(orderList.1.rawValue) 메뉴가 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case latte = "라떼"
    case mocha = "모카"
    case macchiato = "마끼아또"
}
