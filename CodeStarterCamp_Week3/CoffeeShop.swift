//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 맨태 on 1/9/24.
//

import Foundation

final class CoffeeShop{
    private(set) var name: String
    private(set) var address: String
    private(set) var phoneNumber: String
    private var sales: Int
    private var pickUpTable: [String: Coffee] = [:]
    private(set) var menus: [Coffee: Int]
    
    init(name: String, address: String, phoneNumber: String, sales: Int, menus: [Coffee : Int]) {
        self.name = name
        self.address = address
        self.phoneNumber = phoneNumber
        self.sales = sales
        self.menus = menus
    }
    
    func make(_ coffee: Coffee, from name: String) {
        guard let price = menus[coffee] else { return }
        
        sales += price
        pickUpTable[name] = coffee
        print("\(name) 님이 주문하신 \(coffee.name)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}
