//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by Jay Shin on 3/1/24.
//

struct CoffeeShop {
    var totalSales: Int = 0
    var menu: [Coffee: Int] = [.espresso: 4000, .americano: 5000, .cafeLatte: 5500, .cafeMocha: 6000, .vanillaLatte: 6000, .changeToIced: 0]
    var pickUpTable: [String] = []
    var barista: Person
    
    func takeOrders() {
        print("바리스타 \(barista.name)이(가) 주문을 받습니다.")
    }
    
    mutating func makeCoffee(_ coffee: Coffee) {
        pickUpTable.append(coffee.rawValue)
        print("주문받은 \(coffee.rawValue)를 만들었습니다.")
    }
}
