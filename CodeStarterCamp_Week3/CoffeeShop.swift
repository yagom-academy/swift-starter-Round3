//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by hyogang on 2021/12/28.
//

import Foundation

enum Coffee {
    case americano, latte, espresso
}

class CoffeeShop {

    var totalRevenue: Int = 0
    var menuBoard: Dictionary = [Coffee: Int]()
    var pickUpTable: Coffee? {
        didSet (preOrderCoffee) {
            if (preOrderCoffee == nil) {
                guard let customer = self.customer else { return }
                print("\(customer.name)님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
                takeCoffee()
            }
        }
    }
    var barista: Person
    var customer: Person?
    
    init(barista: Person) {
        self.barista = barista
        self.menuBoard = [.americano: 3000, .latte: 4000, .espresso: 2000]
    }
    
    func order(coffee: Coffee, customer: Person){
        guard let price = menuBoard[coffee] else { return }
        self.customer = customer
        totalRevenue += price
        
        make(coffee: coffee)
    }
    
    func make(coffee: Coffee) {
        pickUpTable = coffee
    }
    
    func takeCoffee() {
        pickUpTable = nil
        customer = nil
    }
}
