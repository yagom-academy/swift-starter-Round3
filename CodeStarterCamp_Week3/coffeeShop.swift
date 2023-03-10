//
//  coffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by JSB on 2023/03/09.
//

import Foundation

class CoffeeShop {
    var revenue: Int
    var menu: [Coffee: Int]
    var pickUpTable: [String] = []
    
    init(revenue: Int, menu: [Coffee : Int]) {
        self.revenue = revenue
        self.menu = menu
    }
    
    //커피 주문받고 만드는 함수
    func make(_ coffee: Coffee, for name: String) {
        print("\(name)님이 주문하신 \(coffee.rawValue) 추출중...")
        putInPickUpTable(coffee, for: name)
    }
    
    //커피를 pickUpTable에 올려놓는 함수
    func putInPickUpTable(_ coffee: Coffee, for name: String) {
        self.pickUpTable.append(coffee.rawValue)
        print("\(name)님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
    
    //커피값 받는 함수
    func doGetPaidMoney(_ coffeePrice: Int) {
        self.revenue += coffeePrice
    }
}
