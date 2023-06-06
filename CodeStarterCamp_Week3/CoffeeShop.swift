//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 김예림 on 2023/06/01.
//

import Foundation

typealias Menu = [String: Int]

struct CoffeeShop {
    var sales: Int
    var menu: Menu
    var pickUpTable: [Coffee]
    var barista: String
    
    
    // 바리스타 선택 함수
    private func whoWillMakeCoffee(name barista: String, coffee: Coffee) {
        print("\(barista) 바리스타가 \(coffee.description)를 만듭니다. 잠시만 기다려 주세요.")
    }
    
    // 주문 받고 커피 만들어내는 함수
    mutating func orderCoffeeFromCustomer(for customer: inout Person, menu: Coffee, barista: String) {
        let orderCoffeeMenu: Coffee = customer.chooseCoffee(menu: menu)
        let canCustomerBuyCoffee: Bool = customer.canBuyCoffee(coffee: orderCoffeeMenu)
        
        switch canCustomerBuyCoffee {
        case true:
            whoWillMakeCoffee(name: barista, coffee: orderCoffeeMenu)
            makeCoffee(coffee: orderCoffeeMenu)
            addToPickUpTable(coffee: orderCoffeeMenu)
            countTotalSales(coffee: orderCoffeeMenu)
        case false:
            return print("다음에 다시 주문을 시도해 주세요.")
        }
    }
    
    // 커피 pickUpTable 할당 함수
    private mutating func addToPickUpTable(coffee: Coffee) {
        pickUpTable.append(coffee)
        print("픽업대에서 메뉴를 가져가세요.")
    }
    
    // 커피 만들기 완료 시 호출 함수
    private func makeCoffee(coffee: Coffee) {
        let coffeeType = coffee.description
        print("주문하신 \(coffeeType) 가 완성되었습니다.")
    }
    
    // 총매출 계산 함수
    private mutating func countTotalSales(coffee: Coffee) {
        sales += coffee.price
        print("현재 총 매출액은 \(sales) 입니다.")
    }
}

