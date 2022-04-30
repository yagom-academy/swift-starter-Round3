//
//  File.swift
//  CodeStarterCamp_Week3
//
//  Created by 이정민 on 2022/04/27.
//

class CoffeeShop {
    private(set) var owner: String
    private(set) var location: String
    private(set) var sales: Int = 0
    private(set) var menu: [Coffee: Int] = [:]
    private var pickUpTable: Coffee?
    var barista: Person
    
    init(owner: String, location: String, barista: Person) {
        self.owner = owner
        self.location = location
        self.barista = barista
    }
    
    func add(menu: [Coffee: Int]) {
        self.menu = self.menu.merging(menu, uniquingKeysWith: { $1 })
    }
    
    func order(_ coffee: Coffee, by person: String) {
        if let price = self.menu[coffee] {
            sales += price
        }
        make(coffee: coffee, by: person)
    }
    
    private func make(coffee: Coffee, by person: String) {
        print("\(barista.name)가 커피를 만듭니다.")
    }
}
