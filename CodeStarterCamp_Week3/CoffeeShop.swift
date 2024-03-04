//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by Jay Shin on 3/1/24.
//

class CoffeeShop {
    var name: String
    var totalSales: Int
    var menu: [Coffee: Int] = [:]
    var pickUpTable: [String] = []
    var barista: Person
    
    init(name: String, totalSales: Int, menu: [Coffee : Int], pickUpTable: [String], barista: Person) {
        self.name = name
        self.totalSales = totalSales
        self.menu = menu
        self.pickUpTable = pickUpTable
        self.barista = barista
    }
    
    func make(_ coffee: Coffee, from name: String) {
        pickUpTable.append(coffee.rawValue)
        print("\(name)님이 주문하신 \(coffee.rawValue)가 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}
