//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by ByungHoon Ann on 2022/11/02.
//

import Foundation

struct CoffeeShop {
    let menu: [Coffee: Int]
    let barista: Person
    lazy var pickUpTable = [Coffee]()
    lazy var totalSales = 0
    
    /// 커피 주문 하기 함수
    /// - Parameter coffee: 주문할 커피
    mutating func orderCoffee(coffee: Coffee) {
        if let coffeePrice = menu[coffee] {
            print("주문하신 \(coffee.rawValue)의 가격은 \(coffeePrice)입니다.")
            pickUpTable.append(coffee)
            totalSales += coffeePrice
            print("\(coffee.rawValue) 주문이 완료되었습니다.")
        } else {
            print("\(coffee.rawValue)는 저희 가게에서 판매하지 않습니다.")
        }
    }
    
    /// 현재 가게 매츨액을 출력하는 함수
    mutating func printTotalSales() {
        print("카페의 매출액은 \(totalSales) 입니다")
    }
}
