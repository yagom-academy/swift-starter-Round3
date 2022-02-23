//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var money: Int
    init(money: Int) {
        self.money = money
    }
    func buySomething(price: Int) {
        print(money-price)
    }
}

class CoffeeShop {
    var sales: Int
    var menu: (KindOfCoffee: String, price: Int)
    var pickUpTable: Array<String> = Array<String>()
    
    init(sales: Int, menu: (String,Int), pcikUpTable: Array<String>){
        self.menu = menu
        self.sales = sales
        self.pickUpTable = pcikUpTable
    }
    
    func orderMenu(coffee: Coffee) {
        print("\(coffee)한잔 주문 받았습니다.")
    }
    
    func makeCoffe(coffee: Coffee) {
        print("\(coffee)를 만들었습니다.")
    }
}
