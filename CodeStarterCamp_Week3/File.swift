//
//  File.swift
//  CodeStarterCamp_Week3
//
//  Created by 조기열 on 2022/07/20.
//

import Foundation

struct Person {
    let money: Int
    func buyCoffee(menu: Coffee) {
        switch menu {
        case .cappuccino:
            print("카푸치노 하나 주세요!")
        case .cafeLatte:
            print("카페라때 하나 주세요!")
        case .americano:
            print("아메리카노 하나 주세요!")
        case .esppresso:
            print("에스프레소 하나 주세요!")
        }
        
    }
}

struct CoffeeShop {
    let barista: Person
    let salesRevenue: Int = 0
    var menu: [Coffee: Int] = [:]
    var picUpTable: [String] = []
    
    func takeOrder(menu: Coffee) {
        switch menu {
        case .cappuccino:
            if let price = self.menu[.cappuccino] {
                print("카푸치노는 \(price)입니다.")
            }
        case .cafeLatte:
            if let price = self.menu[.cafeLatte] {
                print("카페라때는 \(price)입니다.")
            }
        case .americano:
            if let price = self.menu[.americano] {
                print("아메리카노는 \(price)입니다.")
            }
        case .esppresso:
            if let price = self.menu[.esppresso] {
                print("에스프레소는 \(price)입니다.")
            }
        }
    }
   
    mutating func makeCoffee(menu: String) {
        picUpTable.append("\(menu)")
    }
}

enum Coffee: String {
    case cappuccino = "카푸치노"
    case cafeLatte = "카페라때"
    case americano = "아메리카노"
    case esppresso = "에스프래소"
}
