//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by junho lee on 2022/07/07.
//

import Foundation

class Person {
    var name: String
    private var cashInWallet: Int
    
    init(name: String, cashInWallet: Int) {
        self.name = name
        self.cashInWallet = cashInWallet
    }
    
    func orderCoffee(type coffee: Coffee, at coffeeShop: CoffeeShop) {
        print("\(coffeeShop.name)에서 \(coffee.rawValue)을 주문합니다.")
        coffeeShop.takeCoffeeOrder(of: self, type: coffee)
    }
    
    func hasMoreCash(than price: Int) -> Bool {
        if cashInWallet >= price {
            return true
        } else {
            print("잔액이 \(price - cashInWallet)원만큼 부족합니다.")
            return false
        }
    }
    
    func pay(_ price: Int) {
        cashInWallet -= price
    }
}

class CoffeeShop {
    var name: String
    var sales: Int = 0
    var menuBoard: Dictionary<Coffee, Int> = [.americano: 2500,
                                              .caffeLatte: 3000,
                                              .cappuccino: 3500,
                                              .macchiato: 4000]
    var pickUpTable = [Coffee]()
    var barista: Person?
    
    init(name: String, barista: Person) {
        self.name = name
        self.barista = barista
    }
    
    func takeCoffeeOrder(of orderCustomer: Person, type coffee: Coffee) {
        guard let coffeePrice: Int = menuBoard[coffee] else {
            return
        }
        
        guard orderCustomer.hasMoreCash(than: coffeePrice) else {
            return
        }
        
        orderCustomer.pay(coffeePrice)
        self.sales += coffeePrice
        
        print("\(orderCustomer.name) 고객님에게 \(coffee.rawValue)를 주문 받았습니다.")
        makeCoffee(coffee, from: orderCustomer.name)
    }
    
    func makeCoffee(_ coffee: Coffee, from name: String) {
        print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다.",
              "픽업대에서 가져가주세요.")
        pickUpTable.append(coffee)
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case caffeLatte = "카페라떼"
    case cappuccino = "카푸치노"
    case macchiato = "마키아또"
}
