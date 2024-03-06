//
//  coffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by CHYUN on 3/1/24.
//

import Foundation

enum Coffee {
    case americano,
         cafeLatte,
         chocolateLatte,
         coldBrew
}


class CoffeeShop {
    var barista: Person
    var totalSales = 0
    var currentOrder : (String, Coffee)? = nil
    var pickUpTable = Array<Coffee>() 
    
    init(barista: Person) {
        self.barista = barista
    }
    
    let americano = 4000
    let cafeLatte = 4500
    
    func takeCoffeeOrder(customer: Person, coffee: Coffee) -> Int {
        currentOrder = (customer.nickName, coffee)
        switch coffee {
        case .americano : return americano
        case .cafeLatte : return cafeLatte
        default : do {
            print("해당 메뉴를 판매하지 않습니다.")
            return 0
            }
        }
    }
    
    func processPayment(paidMoney: Int) {
        if paidMoney != 0 {
            totalSales += paidMoney
            print("결제되었습니다. 닉네임으로 불러드리겠습니다.")
        } else {
            currentOrder = nil
            print("결제 금액이 부족합니다. 주문이 취소되었습니다.")
        }
    }
    
    func makeCoffee(order: (String,  Coffee)?) {
        if let order = order {
            let nickName = order.0
            let coffee = order.1
            
            pickUpTable.append(coffee)
            print("\(nickName)님, 주문하신 \(coffee) 나왔습니다.")
        } else {
            print("주문이 없습니다.")
        }
    }
}
