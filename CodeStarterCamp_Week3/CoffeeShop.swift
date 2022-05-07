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
    var pickUpTable: Coffee? {
        didSet {
            if let coffee = pickUpTable {
                print("\(customerName)님, \(coffee)가 완성되어 픽업 테이블에 올라왔습니다.")
            }
        }
    }
    var barista: Person?
    var customerName: String = ""
    
    init(owner: String, openingHours: String, menu: [Coffee: Int] = [:], barista: Person?) {
        self.owner = owner
        self.openingHours = openingHours
        self.menu = menu
        self.barista = barista
    }
    
    func showMenu() {
        if menu.isEmpty {
            print("현재 메뉴 준비 중입니다.")
        } else {
            print("☕️☕️☕️ \(owner) 카페 메뉴판 ☕️☕️☕️")
            for (coffee, price) in menu {
                print("|| \(coffee) - \(price)원 ||")
            }
            print("----------------------------")
        }

    }
    
    func order(_ coffee: Coffee, price: Int, customerName: String) {
        showMenu() // 이거 여기에 끼워넣었어요. ㅎㅎ
        print("\(customerName) 님의 \(coffee) 주문이 들어왔습니다.")
        self.customerName = customerName
        coffeeShopProfit += price // 파라미터로 들어온 돈을, 가게의 매출에 더해줘요.
        makeCoffee(menu: coffee) // 진짜로 커피를 만드는 메서드 호출
    }
    
    func makeCoffee(_ coffee: Coffee) {
        pickUpTable = coffee
    }
}

//커피 종류 열거형 생성
enum Coffee: String {
    case americano, caffeLatte, caramelMacchiato
    
    static var menu: [Coffee: Int] {
        return [.americano: 4000, .caffeLatte: 4500, .caramelMacchiato: 5000]
    }
}
