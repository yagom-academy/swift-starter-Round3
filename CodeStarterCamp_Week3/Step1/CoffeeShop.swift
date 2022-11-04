//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by ByungHoon Ann on 2022/11/02.
//

import Foundation

class CoffeeShop {
    let menu: [Coffee: Int]
    let barista: Person
    lazy var pickUpTable = [Coffee]()
    lazy var totalSales = 0
    
    init(menu: [Coffee : Int], barista: Person, pickUpTable: [Coffee] = [Coffee](), totalSales: Int = 0) {
        self.menu = menu
        self.barista = barista
        self.pickUpTable = pickUpTable
        self.totalSales = totalSales
    }
    
    /// 커피 주문 하기 함수
    /// - Parameters:
    ///   - coffee: 주문받은 커피
    ///   - from: 주문자 성함
    func make(_ coffee: Coffee, from name: String) {
        if let coffeePrice = getCoffeePrice(coffee) {
            pickUpTable.append(coffee)
            totalSales += coffeePrice
            print("\(name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다 픽업대에서 가져가주세요.")
        } 
    }
    
    func getCoffeePrice(_ coffee: Coffee) -> Int? {
        return menu[coffee]
    }
    
    /// 현재 가게 매츨액을 출력하는 함수
    func printTotalSales() {
        print("카페의 매출액은 \(totalSales) 입니다")
    }
}
