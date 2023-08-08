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
    var money: Int = 0
    
    mutating func buyCoffee(_ coffeeList: [Coffee], from coffeeShop: inout CoffeeShop) {
        let (validateMenu, price) = coffeeShop.validateOrder(coffeeList, orderedBy: self)
        if validateMenu {
            coffeeShop.takeOrder(coffeeList, orderedBy: self, allPrice: price)
            money -= price
        }
    }
}

enum Coffee: String {
    case americano, latte, cappuccino, espresso
}

struct CoffeeShop {
    var sales: Int = 0
    var barista: Person?
    var menu: [Coffee: Int] = [:]
    var pickUpTable: [String: [Coffee]] = [:] {
        didSet {
            printPickupList()
        }
    }
        
    func printPickupList() {
        pickUpTable.forEach{ name, coffees in
            let menu = coffees.map { $0.rawValue }.joined(separator: ", ")
            print("\(name) 님이 주문하신 \(menu)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
    
    func validateOrder(_ coffeeList: [Coffee], orderedBy customer: Person) -> (Bool, Int) {
        var allPrice = 0
        for coffee in coffeeList {
            guard let menuPrice = menu[coffee] else {
                print("해당 메뉴는 존재하지 않습니다.")
                return (false, 0)
            }
            allPrice += menuPrice
        }
        guard customer.money >= allPrice || allPrice != 0 else {
            print("잔액이 \(allPrice - customer.money)원만큼 모자랍니다.")
            return (false, 0)
        }
        return (true, allPrice)
    }
    
    mutating func takeOrder(_ coffeeList: [Coffee], orderedBy customer: Person, allPrice: Int) {
        sales += allPrice
        makeCoffee(coffeeList, customer: customer.name)
    }
    
    mutating func makeCoffee(_ coffeeList: [Coffee], customer name: String) {
        Thread.sleep(forTimeInterval: 3)
        if pickUpTable[name] == nil {
            pickUpTable[name] = coffeeList
        }
        else {
            pickUpTable[name]?.append(contentsOf: coffeeList)
        }
    }
    
    init() {
        menu[Coffee.americano] = 4000
        menu[Coffee.cappuccino] = 4500
        menu[Coffee.latte] = 4500
    }
}

var misterLee = Person(name: "misterLee")
var missKim = Person(name: "missKim", money: 15000)

var yagombucks = CoffeeShop()
yagombucks.barista = misterLee

missKim.buyCoffee([.americano, .cappuccino, .latte], from: &yagombucks)
