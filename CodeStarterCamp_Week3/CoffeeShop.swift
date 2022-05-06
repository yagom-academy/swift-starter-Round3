//
//  Week3Step1CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by mingmac on 2022/05/01.
//

import Foundation

class CoffeeShop {
    var sales: Int = 0
    var barista: Person
    var cafeName: String
    var cafeMenu = Coffee.allCases.map( { $0.name + ": " + String($0.price) + "원" } )
    var pickUpTable: Coffee? {
        didSet {
            if let drink = pickUpTable {
                print("[안내] \(drink) 제조가 완료되었습니다. 픽업대에서 가져가주세요.")
                pickUpTable = nil
                print("[안내] 픽업테이블이 비어있습니다.")
            }
        }
    }
    
    init(barista: Person, cafeName: String) {
        self.barista = barista
        self.cafeName = cafeName
        print("[메뉴판] \(cafeMenu)", "\n")
    }
    
    func order(_ order: Coffee, for customer: Person) {
        print("[커피숍] \(customer.name)님, \(order.name) \(order.price)원 결제가 완료되었습니다.")
        sales += order.price
        print("[안내] 현재 \(cafeName)의 매출액은 \(sales)원 입니다.")
        customer.money -= order.price
        print("[안내] \(customer.name)님의 잔액은 \(customer.money)원 입니다.")
        take(order, for: customer)
    }
    
    func take(_ order: Coffee, for customer: Person) {
        print("[안내] \(barista.name)이(가) \(customer.name)님의 \(order)를 제조합니다.")
        pickUpTable = order
    }
}
