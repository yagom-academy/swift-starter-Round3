//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by Jay Shin on 3/1/24.
//

struct CoffeeShop {
    var totalSales: Int = 0
    var menu: [Coffee: Int] = [:]
    var pickUpTable: [String] = []
    let barista: Person
    
    func takeOrders() {
        print("바리스타 \(barista.name)이(가) 주문을 받습니다.")
    }
    
    mutating func makeCoffee(coffee: Coffee) {
        pickUpTable.append(coffee.rawValue)
        print("주문받은 \(coffee.rawValue)를 만들었습니다.")
    }
}
