//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 이지원 on 2023/06/03.
//

final class CoffeeShop {
    
    private var money = 0
    private(set) var pickUpTable: [Coffee] = []
    
    func takeOrder(to coffee: Coffee) {
        money += coffee.price
        makeCoffee(to: coffee)
    }
    
    private func makeCoffee(to coffee: Coffee) {
        pickUpTable.append(coffee)
    }
    
    init(money: Int) {
        self.money = money
    }
}
