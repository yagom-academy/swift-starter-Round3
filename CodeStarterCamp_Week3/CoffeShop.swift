//
//  File.swift
//  CodeStarterCamp_Week3
//
//  Created by 이정민 on 2022/04/27.
//

struct CoffeeShop {
    var owner: String
    var location: String
    var pickUpTable: Bool
    var sales: Int = 0
    var menu: Dictionary<String,Int> = [:]
    var barista: Person?
    
    init(owner: String, location: String, pickUpTable: Bool) {
        self.owner = owner
        self.location = location
        self.pickUpTable = pickUpTable
    }
    
    func order(_ coffee: Coffee) {
        print("\(coffee.rawValue)가 준비되었습니다.")
    }
}
