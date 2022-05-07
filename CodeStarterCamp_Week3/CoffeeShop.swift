//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by Jiyoung Lee on 2022/05/07.
//

import Foundation

class CoffeeShop {
    var sales: Int = 0
    var barista: Person
    var menuBoard: [Coffee: Int] = [:]
    var customer: String = ""
    var pickUpTable: String = "" {
        didSet {
            print("\(customer)님의 \(pickUpTable)가 준비되었습니다. 픽업대에서 가져다주세요.")
        }
    }
    
    init(barista: Person) {
        self.barista = barista
    }
    
    func order(_ coffee: Coffee, customer: String) {
        guard let coffeePrice = menuBoard[coffee] else {
            return
        }
        self.customer = customer
        sales += coffeePrice
        pickUpTable = coffee.coffeeString

    }
    


    func addMenu(coffee: Coffee, price: Int) {
        menuBoard[coffee] = price
    }
}
