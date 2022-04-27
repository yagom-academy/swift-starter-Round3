//
//  File.swift
//  CodeStarterCamp_Week3
//
//  Created by 이정민 on 2022/04/27.
//

struct CoffeeShop {
    private(set) var owner: String
    private(set) var location: String
    private(set) var sales: Int = 0
    private(set) var menu: [Coffee: Int] = [:]
    var pickUpTable: Bool
    var barista: Person?
    
    init(owner: String, location: String, pickUpTable: Bool) {
        self.owner = owner
        self.location = location
        self.pickUpTable = pickUpTable
    }
    
    mutating func change(in coffee: Coffee, price: Int) {
        guard self.menu.keys.contains(coffee) else {
            print("No Exist \(coffee.rawValue) in Menu")
            return
        }
        self.menu[coffee] = price
    }
    
    mutating func add(menu: [Coffee: Int]) {
        self.menu = self.menu.merging(menu, uniquingKeysWith: { $1 })
    }
    
    func order(_ coffee: Coffee) {
        print("\(coffee.rawValue)가 준비되었습니다.")
    }
}
