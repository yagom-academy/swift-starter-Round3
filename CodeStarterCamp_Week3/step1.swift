//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by junho lee on 2022/07/07.
//

import Foundation

class Person {
    internal var name: String
    private var cashInWallet: Int
    
    init(name: String, cashInWallet: Int) {
        self.name = name
        self.cashInWallet = cashInWallet
    }
    
    internal func orderCoffee(type coffee: Coffee, at coffeeShop: CoffeeShop) {
        print("\(coffeeShop.name)에서 \(coffee.rawValue)을 주문합니다.")
        coffeeShop.takeCoffeeOrder(of: self, type: coffee)
    }
    
    internal func hasMoreCash(than price: Int) -> Bool {
        if cashInWallet >= price {
            return true
        } else {
            print("잔액이 \(price - cashInWallet)원만큼 부족합니다.")
            return false
        }
    }
    
    internal func pay(_ price: Int) {
        cashInWallet -= price
    }
}

class CoffeeShop {
    internal var name: String
    private var sales: Int = 0
    internal var menuBoard: Dictionary<Coffee, Int> 
    private var pickUpTable = [(coffe: Coffee, customerName: String)]() {
        didSet {
            guard let coffeeInPickUpTable = pickUpTable.last else {
                return
            }
            print("\(coffeeInPickUpTable.customerName) 님이 주문하신",
                  "\(coffeeInPickUpTable.coffe.rawValue)(이/가)",
                  "준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
    private var barista: Person?
    
    init(name: String, barista: Person, menuBoard: Dictionary<Coffee, Int>) {
        self.name = name
        self.barista = barista
        self.menuBoard = menuBoard
    }
    
    internal func takeCoffeeOrder(of orderCustomer: Person,
                                  type coffee: Coffee) {
        guard let coffeePrice: Int = menuBoard[coffee] else {
            return
        }
        
        guard orderCustomer.hasMoreCash(than: coffeePrice) else {
            return
        }
        
        orderCustomer.pay(coffeePrice)
        addSales(coffeePrice)
        
        print("\(orderCustomer.name) 고객님에게 \(coffee.rawValue)를 주문 받았습니다.")
        makeCoffee(coffee, from: orderCustomer.name)
    }
    
    private func makeCoffee(_ coffee: Coffee, from name: String) {
        pickUpTable.append((coffee, name))
    }
    
    private func addSales(_ slaes: Int) {
        self.sales += sales
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case caffeLatte = "카페라떼"
    case cappuccino = "카푸치노"
    case macchiato = "마키아또"
}
