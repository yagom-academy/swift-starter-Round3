//
//  coffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 수염 on 2022/05/05.
//

import Foundation


class CoffeeShop {
    var name: String
    var dailyTotal: Int
    var pickUpTable: Bool
    var barista: Person
    
    init(name: String, dailyTotal: Int, pickUpTable: Bool, barista: Person) {
        self.name = name
        self.dailyTotal = dailyTotal
        self.pickUpTable = pickUpTable
        self.barista = barista
    }
    
    func greeting() {
        print("\(barista.name): 어서오세요. \(name)입니다.")
        print(" ☕️ MENU ☕️ ")
        for Coffee in Coffee.allCases {
            print("\(Coffee.menuName): \(Coffee.price)")
        }
        print("")
    }
    
    func order(_ coffee: Coffee, _ customer: Person, _ cafe: CoffeeShop) {
        dailyTotal += coffee.price
        print("〰️ 음료 만드는 중 〰️")
        if pickUpTable == true {
            print("\(customer.name) 님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
        }
        print("\(cafe.name) 매출: \(cafe.dailyTotal) 원")
    }
}

