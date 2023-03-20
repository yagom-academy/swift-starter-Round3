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

struct OrderedCoffee {
    let coffee: Coffee
    let by: String
}

class Person {
    var name: String
    var money: Int
    
    init( name: String, money: Int) {
        self.money = money
        self.name = name
    }
    
    func order(_ coffeeShop: CoffeeShop, of coffee: Coffee, by name: String) {
        guard let coffeePrice = coffeeShop.takeOrder(coffee: coffee, name: name) else {
            return
        }
        
        if money < coffeePrice {
            print("잔액이 \(coffeePrice - money)원 부족합니다. 현재 잔액은 \(money)원 입니다.")
            return
        }
        money -= coffeePrice
        coffeeShop.addRevenue(coffeePrice)
        coffeeShop.make(coffee, for: name)
    }
    
    func pickUp(coffeeShop: CoffeeShop) {
        coffeeShop.pickUp(by: name)
    }
}

let group = DispatchGroup()

class CoffeeShop {
    var name: String = "CoffeeShop"
    var revenue: Int = 0
    var menu: [Coffee: Int]
    var pickUpTable: [OrderedCoffee]
    var brista: [Person]
    
    init(name: String, revenue: Int, menu: [Coffee: Int], pickUpTable: [OrderedCoffee] = [], brista: [Person]) {
        self.name = name
        self.revenue = revenue
        self.menu = menu
        self.pickUpTable = pickUpTable
        self.brista = brista
    }
    
    func addRevenue(_ price: Int) {
        revenue += price
    }
    func printRevenue() {
        print("...총 매출:", revenue, "원")
    }
    
    func takeOrder(coffee: Coffee, name: String) -> Int? {
        guard let coffeePrice = menu[coffee] else {
            print("해당 커피는 판매하지 않습니다. 메뉴를 확인해주세요.")
            printMenu()
            return nil
        }
        
        print("\(name)님, \(coffee)를 주문하셨습니다. \(coffeePrice)원 입니다.")
        return coffeePrice
    }
    
    func make(_ coffee: Coffee, for name: String) {
        self.addPickUpTable(coffee, for: name)
    }
    
    func addPickUpTable(_ coffee: Coffee, for name: String) {
        self.pickUpTable.append(OrderedCoffee(coffee: coffee, by: name))
        print("🔔 \(name) 님이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
    
    func pickUp(by name: String) {
        let pickedUpCoffees = pickUpTable.filter { $0.by == name }
        pickUpTable = pickUpTable.filter { $0.by != name }

        if pickedUpCoffees.isEmpty {
            print("테이블에 내 커피가 없습니다.")
            return
        }
        print("\(name)님, 주문하신 \(pickedUpCoffees.map { "\($0.coffee)" }.joined(separator: ", ")) 여기 있습니다. 맛있게 드세요.")
    }

    func printMenu() {
        print("_____\(self.name)의 메뉴입니다._____")
        for (key, value) in self.menu {
            print("\(key) : \(value)원")
        }
    }
}
