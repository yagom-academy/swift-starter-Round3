//
//  main.swift
//  week3-step01
//
//  Created by karen on 2023/03/08.
//

import Foundation
let misterLee = Person(money: 1000)
let missKim = Person(money: 1000)
var yagomMenu: Dictionary<Coffee, Int> = [Coffee.moca: 5000, Coffee.iceMoca: 5500, Coffee.americano: 3000, Coffee.iceAmericano: 3500, Coffee.caramel: 4500, Coffee.iceCaramel: 5000, Coffee.espresso: 2500, Coffee.cappuccino: 4000, Coffee.hazelnut: 4000, Coffee.latte: 4000, Coffee.iceLatte: 4500]
var yagombucks = CoffeeShop(totalSales:0, barista: misterLee, menu: yagomMenu)


enum Coffee: String {
    case moca = "카페 모카", iceMoca = "아이스 카페모카"
    case americano = "아메리카노", iceAmericano = "아이스 아메리카노"
    case caramel = "카라멜 마끼야또", iceCaramel = "아이스 카라멜 마끼야또"
    case espresso = "에스프레소"
    case cappuccino = "카푸치노"
    case hazelnut = "헤이즐넛"
    case latte = "카페 라떼", iceLatte = "아이스 카페 라떼"
}

struct Person {
    var money: Int
    func purchaseCoffee(_ coffee: Coffee) {
        print("\(coffee)를 구매합니다.")
    }
}

struct CoffeeShop {
    var totalSales: Int
    var barista: Person
    var menu: Dictionary<Coffee, Int>
    var pickUpTable: Array<Coffee> = Array<Coffee>()
    
    mutating func takeOnOder(coffee: Coffee) {
        self.createCoffee(order: coffee)
        print("주문받겠습니다.")
    }
    
    mutating func createCoffee(order: Coffee) {
        self.pickUpTable.append(order)
        print("주문하신 \(order.rawValue) 나왔습니다.")
    }
    
}





