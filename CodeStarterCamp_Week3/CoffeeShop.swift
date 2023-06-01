//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 김예림 on 2023/06/01.
//

import Foundation

struct CoffeeShop {
    var sales: Int
    var menu: [(coffee: String, price: Int)]
    var pickUpTable: [Coffee]
    
    // 주문을 받는 함수
    mutating func orderCoffeeFromCustomer(customer: inout Person, menu: Coffee) {
        let orderCoffeeMenu: Coffee = customer.chooseCoffee(menu: menu)
        let canCustomerBuyCoffee = customer.tryBuyCoffee(coffee: orderCoffeeMenu)
        
        if canCustomerBuyCoffee == "Success" {
            let _ = makeCoffee(coffee: orderCoffeeMenu)
            let currentSales = countTotalSales(coffee: orderCoffeeMenu)
            return print("현재 총 매출액은 \(currentSales) 입니다.")
        }
        
        print("다음에 다시 주문을 시도해 주세요.")
        
    }
    
    // 커피 만드는 함수
    mutating func makeCoffee(coffee: Coffee) -> [Coffee] {
        let coffeeType = coffee.coffeeType
        print("주문하신 \(coffeeType)가 완성되었습니다.")
        pickUpTable.append(coffee)
        
        return pickUpTable
    }
    
    // 총매출 계산 함수
    mutating func countTotalSales(coffee: Coffee) -> Int {
        let coffeePrice = coffee.price
        sales += coffeePrice
        
        return sales
    }
}

enum Coffee {
    case americano
    case caffeLatte
    case espresso
    
    var coffeeType: String {
        switch self {
        case .americano:
            return "아메리카노"
        case .caffeLatte:
            return "카페라떼"
        case .espresso:
            return "에스프레소"
        }
    }
    
    var price: Int {
        switch self {
        case .americano:
            return 5000
        case .caffeLatte:
            return 5500
        case .espresso:
            return 4500
        }
    }
}
