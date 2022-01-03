//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by hyogang on 2021/12/28.
//

import Foundation

enum Coffee: String {
    case americano, latte, espresso
}

class CoffeeShop {

    var totalRevenue: Int = 0
    var menuBoard: Dictionary = [Coffee: Int]()
    var pickUpTable: Coffee? {
        didSet {
            if let customer = self.customer {
                print("\(customer.name)님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
            }
        }
    }
    var barista: Person
    var customer: Person?
    
    init(barista: Person) {
        self.barista = barista
        self.menuBoard = [.americano:3000, .latte:4000, .espresso:2000]
    }
    
    func orderCoffee(coffee: Coffee){
        guard let price = menuBoard[coffee] else { return }
        guard let customer = self.customer else { return }

        if (customer.money < price) {
            print("잔액이 \(price)원만큼 부족합니다.")
            return
        }
        customer.money -= price
        totalRevenue += price
        
        makeCoffee(coffee: coffee)
    }
    
    func makeCoffee(coffee: Coffee) {
        pickUpTable = coffee
    }
}
