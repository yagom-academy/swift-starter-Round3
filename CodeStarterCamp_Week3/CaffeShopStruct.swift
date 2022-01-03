//
//  CaffeShopStruct.swift
//  CodeStarterCamp_Week3
//
//  Created by 김동욱 on 2021/12/31.
//

import Foundation

enum CoffeeList {
    case americano, latte, espresso
    var price: Int {
        switch self {
        case .americano:
            return 1500
        case .latte:
            return 2000
        case .espresso:
            return 1000
        }
    }
}

class CoffeeShop {
    
    var barista: Person
    var customer: Person?
    var coffeeMenuBoard: CoffeeList?
    var dailySales: Int = 0
    var orderName: String = ""
    var pickUpTable: [String : String] = [:]
    
    init(barista: Person) {
        self.barista = barista
    }
    
    func takeOrderTo(coffee: CoffeeList, guest: Person) {
        print("카페 직원: 주문하신 \(coffee)는 \(coffee.price) 원 입니다")
        dailySales += coffee.price
        makeCoffee(coffee: coffee, guest: guest)
    }
    
    func makeCoffee(coffee: CoffeeList, guest: Person) {
        orderName = guest.name
        print("\(orderName) 의 \(coffee)를 추출 합니다")
        moveToPickUpTable(coffee: coffee)
    }
    
    func moveToPickUpTable(coffee: CoffeeList) {
        pickUpTable.updateValue("\(coffee)", forKey: orderName)
        guard let makedCoffee = pickUpTable[orderName] else { return }
        print("\(orderName) 님의 \(makedCoffee) 가 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}
