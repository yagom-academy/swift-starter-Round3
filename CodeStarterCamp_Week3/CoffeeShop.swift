//
//  File.swift
//  CodeStarterCamp_Week3
//
//  Created by NAMU on 2022/03/07.
//

import Foundation

class CoffeeShop {
    var totalSales = 0
    var menu = [Coffee: Int]()
    var pickUpTable = [Coffee]() {
            didSet {
                if pickUpTable.count > 0 {
                    print("\(customerName) 님의 \(pickUpTable[0].rawValue)가 준비되었습니다. 픽업대에서 가져가주세요.")
                }
            }
        }
    var customerName = ""
    var barista: Person?
    
    init(menu: [Coffee: Int]) {
        self.menu = menu
    }
    
    func takeOrder(_ coffee: Coffee, from person: Person) {
            switch coffee {
            case .americano:
                makeCoffee(.americano, for: person)
            case .latte:
                makeCoffee(.latte, for: person)
            case .cappuccino:
                makeCoffee(.cappuccino, for: person)
            }
        }
    
    func makeCoffee(_ coffeePrice: Int, for person: Person) {
        if person.money >= coffeePrice {
            person.purchase(coffeePrice)
            customerName = person.name
            pickUpTable = true
            totalSales += coffeePrice
        } else {
            print("현재 잔액이 \(coffeePrice - person.money)원 부족합니다.")
        }
        pickUpTable = false
    }
}
