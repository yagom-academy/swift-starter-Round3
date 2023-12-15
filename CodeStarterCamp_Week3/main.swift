//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//


// 2023-11-28 by ss_12_daeho8078
// Round3-Step2: 타입과 인스턴스 관계

import Foundation

//Person 타입을 구조체로 설정
struct Person {
    var balance: Int
    var name: String
    
    mutating func order(_ coffee: Coffee, coffeshop: CoffeeShop, by name: String) {
        guard let price = coffeshop.menu[coffee] else {
            print("주문하신 메뉴는 없는 메뉴 입니다.")
            return
        }
        
        if price > balance {
            print("잔액이 \(price - balance)원 만큼 부족합니다.")
        }else{
            balance -= price
            coffeshop.takeOrder(coffee,name)
        }
        
    }
    
}

class CoffeeShop {
    var barista: Person
    var totalSales: Int = 0
    var menu: [Coffee:Int]
    var pickUpTable: [Coffee] = []
    
    init(barista: Person, menu: [Coffee:Int]) {
        self.barista = barista
        self.menu = menu
        
    }
    
    func takeOrder(_ coffee: Coffee, _ name: String) {
        pickUpTable.append(coffee)
        totalSales += coffee.rawValue
        make(coffee, from: name)
    }
    
    func make(_ coffee: Coffee, from name: String){
        print("\(name) 님이 주문하신 \(coffee)가 준비 되었습니다. 픽업대에서 가져가주세요.")
        
    }
    
    func total() {
        print("현재 매출은 \(totalSales)원 입니다.")
    }
    
}

enum Coffee: Int {
    case iceAmericano = 2500
    case hotAmericano = 2000
    case iceChoco = 3000
    case caramel = 3500
    case icetea = 4000
    
}


var misskim: Person = Person(balance: 3200, name: "leedaeho")
var missLee: Person = Person(balance: 5000, name: "younho")
var yagombucks: CoffeeShop = CoffeeShop(barista: misskim, menu: [
    .iceAmericano : 2500,
    .hotAmericano : 2000,
    .caramel : 4000,
    .icetea : 4500
])


misskim.order(.iceAmericano, coffeshop: yagombucks, by: "leedaeho")
missLee.order(.icetea, coffeshop: yagombucks, by: "yougho")
yagombucks.total()

