//
//  CoffeePosMachine.swift
//  CodeStarterCamp_Week3
//
//  Created by minsong kim on 2023/03/06.
//

import Foundation


struct Person {
    var money: Int
    var price: Int
    var menu: String
    
    func buyCofffee() {
        if money > price {
            print("\(menu) 한 잔을 구매하였습니다. 남은 잔액은 \(money - price)입니다." )
        } else {
            print("금액이 부족합니다.")
        }
    }
}

struct Menu {
    enum Coffee {
        case americano, decaffeine, latte, vanilla, caramel, cappuccino
        
        func CoffeeName() -> String {
            switch self {
            case .americano:
                return "아메리카노"
            case .decaffeine:
                return "디카페인"
            case .latte:
                return "라떼"
            case .vanilla:
                return "바닐라 라떼"
            case .caramel:
                return "카라멜 마끼아또"
            case .cappuccino:
                return "카푸치노"
            }
        }
            
        func CoffeePrice(beans: Int, lattes: Int) -> Int {
            switch self {
            case .americano, .decaffeine:
                return beans
            case .latte, .vanilla, .caramel, .cappuccino:
                return lattes
            }
        }
    }
}

struct CoffeeShop {
    var barista: Person
    var sales: Int = 0
    var pickUpTable: Array<String>
    var lattesPrice: Int
    var beansPrice: Int

    mutating func processOrder(number: Int, menu: String, totalPrice: Int) {
        self.pickUpTable.append(menu)
        self.sales = self.sales + totalPrice
        print ("\(number)번 손님 주문하신 \(menu) 나왔습니다.")
    }
    
    mutating func checkSales() {
        print ("현재까지 총 매출액은 \(sales)원 입니다.")
    }
}
