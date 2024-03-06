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
         vanilaLatte,
         coldBrew,
         oatLatte,
         milkTea,
         vienna,
         iceCreamLatte
}

class CoffeeShop {
    var barista: Person
    var totalSales = 0
    var currentOrder : (String, Coffee)? = nil
    var pickUpTable = Array<(String, Coffee)>() {
        didSet {
            showPickUpTable()
        }
    }
    
    init(barista: Person) {
        self.barista = barista
    }
    
    let americano = 4000
    let cafeLatte = 4500
    let oatLatte = 4500
    let milkTea = 5000

    
    func takeCoffeeOrder(customer: Person, coffee: Coffee) -> Int {
        currentOrder = (customer.nickName, coffee)
        switch coffee {
        case .americano : return americano
        case .cafeLatte : return cafeLatte
        case .oatLatte : return oatLatte
        case .milkTea : return milkTea
        default : do {
            print("해당 메뉴를 판매하지 않습니다.")
            return 0
            }
        }
    }
    
    func processPayment(paidMoney: Int) {
        if paidMoney != 0 {
            totalSales += paidMoney
            print("결제되었습니다.")
        } else {
            currentOrder = nil
            print("결제 금액이 부족합니다. 주문이 취소되었습니다.")
        }
    }
    
    func makeCoffee(order: (String,  Coffee)?) {
        if let order = order {
            let nickName = order.0
            let coffee = order.1
            pickUpTable.append((nickName, coffee))
        } else {
            print("주문이 없습니다.")
        }
    }
    
    func showPickUpTable() {
        if !pickUpTable.isEmpty {
            let tableStart = "----- Pick Up Here ------"
            let tableEnd = "-------------------------"
            for (nickName, coffee) in pickUpTable {
                print("\(tableStart)\n\(nickName) - \(coffee)\n\(tableEnd)")
            }
        }
    }
}
