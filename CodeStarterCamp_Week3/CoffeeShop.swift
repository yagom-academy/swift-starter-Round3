//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 정선아 on 2022/04/27.
//

import Foundation

class CoffeeShop {
    let owner: String
    let openingHours: String
    var coffeeShopProfit: Int = 0
    var menu: [Coffee: Int]
    var pickUpTable: Coffee? = nil
    var barista: Person?
    init(owner: String, openingHours: String, menu: [Coffee: Int] = [:], barista: Person?) {
        self.owner = owner
        self.openingHours = openingHours
        self.menu = menu
        self.barista = barista
    }
    
    func showMenu() -> String {
        var menuDetail = "\(owner) 카페 메뉴판\n"
        if menu.isEmpty {
            return "현재 메뉴 준비 중입니다."
        } else {
            for (coffee, price) in menu {
                menuDetail += "|| \(coffee) - \(price)원 ||\n"
            }
        }
        return menuDetail
    }
    
    func order(_ coffee: Coffee, by customer: Person) -> Coffee? {
        if openingHours.isEmpty {
            print("아직 오픈 시간이 아닙니다.")
        } else {
            if let price = menu[coffee] {
                if customer.isPayable(price) {
                    print("\(coffee)가 주문 되었습니다.")
                    coffeeShopProfit += price
                    makeCoffee(coffee)
                    return coffee
                } else {
                    print("잔액이 \(price - customer.walletInCash)만큼 부족합니다.")
                }
            }
        }
        return coffee
    }
    
    func makeCoffee(_ coffee: Coffee) {
        pickUpTable = coffee
        print("\(coffee)가 완성되어 픽업 테이블에 올라왔습니다.")
    }
}

//커피 종류 열거형 생성
enum Coffee: String {
    case americano, caffeLatte, caramelMacchiato
    
    static var menu: [Coffee: Int] {
        return [.americano: 4000, .caffeLatte: 4500, .caramelMacchiato: 5000]
    }
}
