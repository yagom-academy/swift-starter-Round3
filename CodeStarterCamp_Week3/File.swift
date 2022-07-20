//
//  File.swift
//  CodeStarterCamp_Week3
//
//  Created by 조기열 on 2022/07/20.
//

import Foundation

struct Person {
    let money: Int
    func buyCoffee(menu: String) {
        if let someMenu = Coffee(rawValue: menu) {
            switch someMenu {
            case .cappuccino:
                print("카푸치노 하나 주세요")
            case .cafeLatte:
                print("카페라떼 하나 주세요")
            case .americano:
                print("아메리카노 하나 주세요")
            case .esppresso:
                print("에스프레소 하나 주세요")
            }
        }
    }
}

struct CoffeeShop {
    let barista: Person
    let salesRevenue: Int = 0
    var menu: [Coffee: Int] = [
        .cappuccino: 5000,
        .cafeLatte: 5500,
        .americano: 4500,
        .esppresso: 4000,
    ]
    var picUpTable: [String] = []
    func takeOrder(menu: String) {
        print("가격은",terminator: " ")
        if menu == "카푸치노" {
            print(self.menu[.cappuccino]!,terminator: "")
        } else if menu == "카페라때" {
            print(self.menu[.cafeLatte]!,terminator: "")
        } else if menu == "아메리카노" {
            print(self.menu[.americano]!,terminator: "")
        } else if menu == "에스프레소" {
            print(self.menu[.americano]!,terminator: "")
        }
        print("원 입니다!")
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

var misterLee = Person(money: 10000)
var missKim = Person(money: 10000)
var yagombucks = CoffeeShop(barista: misterLee)
