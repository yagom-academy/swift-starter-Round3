//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by hyogang on 2021/12/28.
//

import Foundation

class CoffeeShop {
    
    enum Coffee: String {
        case americano, latte, espresso
    }
    
    var totalRevenue: Int = 0
    var menuBoard: Dictionary = [Coffee: Int]()
    var pickUpTable: Coffee?
    var barista: Person
    
    init(barista: Person) {
        self.barista = barista
    }
    
    func orderCoffee(coffee: Coffee, amount: Int, guest: Person) {
        guard let price = menuBoard[coffee] else { return }
        let totalPrice = price * amount
        
        print("\(guest.name) : \(coffee) \(amount)잔 주세요.")
        print("\(barista.name) : \(totalPrice)입니다.")
        
        guest.purchaseSomething(price: totalPrice, item: coffee.rawValue)
        totalRevenue += totalPrice
        
        makeCoffee(coffee: coffee, amount: amount)
    }
    
    func makeCoffee(coffee: Coffee, amount: Int) {
        pickUpTable = coffee
        print("\(barista.name) : \(coffee) \(amount)잔 나왔습니다!")
    }
}

class Market {
    
    enum Coffee: String {
        case aaa, bbb, ccc
    }
    
    
}
