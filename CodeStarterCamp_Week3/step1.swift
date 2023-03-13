//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by Appledayz on 2023/03/09.
//

import Foundation

enum Coffee {
    case espresso
    case americano
    case coldBrew
    case cappuccino
}

class Person {
    var name: String
    var money: Int
    
    init( name: String, money: Int) {
        self.money = money
        self.name = name
    }
    
    func order(_ coffeeShop: CoffeeShop, of coffee: Coffee, by name: String) {
        print("-------------------------------")
        guard let coffeePrice = coffeeShop.menu[coffee] else {
            print("해당 커피는 판매하지 않습니다. 메뉴를 확인해주세요.")
            return
        }
        print("\(name)님, \(coffee)를 주문하셨습니다. \(coffeePrice)원 입니다.")
        guard coffeePrice <= self.money else {
            print("잔액이 \(coffeePrice - self.money)원만큼 부족합니다.")
            return
        }
        
        self.money -= coffeePrice
        let isOrderComplete = coffeeShop.takeOrder(coffee: coffee, name: name)
        
        if isOrderComplete {
            print("주문이 정상 처리되었습니다.")
            return
        } else {
            self.money += coffeePrice
            return
        }
    }
}


let group = DispatchGroup()

class CoffeeShop {
    var revenue: Int = 0
    var menu: Dictionary<Coffee, Int>
    var pickUpTable: [Coffee]
    var brista: [Person]
    
    init(revenue: Int, menu: Dictionary<Coffee, Int>, pickUpTable: [Coffee] = [], brista: [Person]) {
        self.revenue = revenue
        self.menu = menu
        self.pickUpTable = pickUpTable
        self.brista = brista
    }
    
    func addRevenue(_ price: Int) {
        revenue += price
    }
    
    func takeOrder(coffee: Coffee, name: String) -> Bool {
        guard let coffeePrice = self.menu[coffee] else {
            print("해당 커피는 판매하지 않습니다. 메뉴를 확인해주세요.")
            return false
        }
        self.addRevenue(coffeePrice)
        self.make(coffee, for: name)
        return true
    }
    
    func make(_ coffee: Coffee, for name: String) {
        group.enter()
        DispatchQueue.global().asyncAfter(deadline: .now() + Double.random(in: 1...4)) {
            self.addPickUpTable(coffee, for: name)
            group.leave()
        }
    }
    
    func addPickUpTable(_ coffee: Coffee, for name: String) {
        self.pickUpTable.append(coffee)
        print("🔔 \(name) 님이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}
