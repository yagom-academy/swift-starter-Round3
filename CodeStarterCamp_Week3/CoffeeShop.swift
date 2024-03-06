//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by Jay Shin on 3/1/24.
//

class CoffeeShop {
    let name: String
    var totalSales: Int
    var menu: [Coffee: Int]
    var pickUpTable: [String]
    var barista: Person
    
    init(name: String, totalSales: Int, menu: [Coffee : Int], pickUpTable: [String], barista: Person) {
        self.name = name
        self.totalSales = totalSales
        self.menu = menu
        self.pickUpTable = pickUpTable
        self.barista = barista
    }
    
    func make(_ coffee: Coffee, from customer: String) {
        pickUpTable.append(coffee.rawValue)
        print("\(customer)님이 주문하신 \(coffee.rawValue)가 준비되었습니다. 픽업대에서 가져가주세요.")
    }
    
    func getMoney(_ coffee: Coffee, _ price: Int, from customer: String) {
        totalSales += price
        print("\(name)에 \(price)원 매출이 발생했습니다. (\(name)의 매출액: \(totalSales))")
        make(coffee, from: customer)
    }
}
