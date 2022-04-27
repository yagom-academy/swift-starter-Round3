//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 정선아 on 2022/04/27.
//

import Foundation
class CoffeeShop {
    var owner: String
    var openingHours: String
    var coffeeShopSales: Int?
    var menu: Dictionary<Coffee, Int> = [:]
    var pickUpTable: Bool?
    var barista: Person?
    init(owner: String, openingHours: String, coffeeShopSales: Int, menu: Dictionary<Coffee, Int> = [:], pickUpTable: Bool, barista: Person) {
        self.owner = owner
        self.openingHours = openingHours
        self.coffeeShopSales = coffeeShopSales
        self.menu = menu
        self.pickUpTable = pickUpTable
        self.barista = barista
    }
    init(owner: String, openingHours: String) {
        self.owner = owner
        self.openingHours = openingHours
    }
    func orderCoffee() {
        print("커피를 주문합니다.")
    }
    func makeCoffee() {
        print("커피를 만드는 중입니다.")
    }
}

//커피 종류 열거형 생성
enum Coffee: String {
    case Americano, CaffeLatte, CaramelMacchiato
}

//커피 종류 열거형이 key가 되어 coffeeMenu 딕셔너라 생성
let coffeeMenu: [Coffee: Int] = [
        .Americano: 4000,
        .CaffeLatte: 4500,
        .CaramelMacchiato: 5000
    ]
