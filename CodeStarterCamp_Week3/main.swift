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
    var menu: [Coffee: Int]
    var pickUpTable: Array<String> = Array<String>()
    var barista: Person
    var sales: Int
    var yagombucks: CoffeeShop
    
    init(yagombucks: CoffeeShop, sales: Int, menu: [Coffee: Int], pickUpTable: Array<String>, barista: Person) {
        self.menu = [.americano: 3000, .cafeLatte: 3500, .coldBrew: 4000]
        self.pickUpTable = pickUpTable
        self.barista = barista
        self.sales = sales
        self.yagombucks = yagombucks
    }
    
    enum Coffee {
        case americano, cafeLatte, coldBrew
    }
    
    func orderMenu(coffee: Coffee) {
        print("\(coffee)한잔 주문 받았습니다.")
    }
    
    func makeCoffee(coffee: Coffee) {
        print("\(coffee)를 만들었습니다.")
    }
    
    func putOn(pickUpTable: Array<String>, person: Person, coffee: Coffee) {
        let PickUpTable = "\(coffee)"
        print(PickUpTable)
        print("\(person.name)님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
    }
    
    func goingUp(price: Coffee) {
        var sumSales: Int = 0
        if let price = menu[price] {
            sumSales += price
            sales = sumSales
        }
        print("yagombucks의 매출이 \(sales)원 올랐습니다.")
    }
}
