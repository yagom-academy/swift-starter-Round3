//
//  CoffeePosMachine.swift
//  CodeStarterCamp_Week3
//
//  Created by minsong kim on 2023/03/06.
//

import Foundation

class Person {
    var money: Int
    var nickname: String
    var myOrder: Coffee?
    
    init(money: Int, nickname: String) {
        self.money = money
        self.nickname = nickname
    }
    
    func order(_ coffee: Coffee) {
        myOrder = coffee
    }
}

enum Coffee: String {
    case americano = "아메리카노", decaffeine = "디카페인"
    case latte = "라떼", vanilla = "바닐라라떼", caramel = "카라멜 마끼아또", cappuccino = "카푸치노"
}

struct CoffeeShop {
    var barista: Person
    var totalSales: Int
    var pickUpTable: Array<String>
    var menu: [Coffee: Int] = [.americano: 2500, .decaffeine: 2500, .vanilla: 3500, .caramel: 3500, .cappuccino: 3500]

    mutating func takeOrder(from customer: Person) {
        if let customerOrder = customer.myOrder, let price = menu[customerOrder] {
            print ("\(customer.nickname)님, \(customerOrder.rawValue) 주문 받았습니다. 지불하실 금액은 \(price)원 입니다.")
            if customer.money < price {
                print("금액이 \(price - customer.money)만큼 모자랍니다.")
            } else {
                customer.money -= price
                totalSales += price
                processOrder(customerOrder, from: customer)
            }
        } else {
            print("죄송하지만 주문하신 메뉴는 현재 판매하고 있지 않습니다.")
        }
    }
    
    private mutating func processOrder(_ coffee: Coffee, from customer: Person) {
        pickUpTable.append(coffee.rawValue)
        print("\(customer.nickname)님, 주문하신 \(coffee.rawValue) 나왔습니다.")
    }
    
    func checkSales() {
        print("현재까지 총 매출액은 \(totalSales)원 입니다.")
    }
}
