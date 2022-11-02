//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by ByungHoon Ann on 2022/11/02.
//

import Foundation

struct CoffeeShop {
    let menu: [Coffee: Int]
    let barista: Person
    lazy var pickUpTable = [Coffee]()
    lazy var totalSales = 0
    
    mutating func orderCoffee(coffee: Coffee) {
        if let coffeePrice = menu[coffee] {
            print("주문하신 \(coffee)의 가격은 \(coffeePrice)입니다.")
            pickUpTable.append(coffee)
            totalSales += coffeePrice
            print("\(coffee) 주문이 완료되었습니다")
        }
    }
}
