//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var money: Int = 0
    
    func buyCoffe(){
        print("카피를 주문하였습니다.")
    }
}

class CoffeeShop{
        var sales: Int = 0
        var menu: [Coffee: Int]
        var pickUpTable = [Coffee]()
        var barista: Person

    
    init(barista: Person, menu:[Coffee: Int]){
        self.barista = barista
        self.menu = menu
    }
    func takeCoffee(type: Coffee){
        print("\(type) 주문이 들어왔습니다. 제조를 시작합니다.")
        pickUpTable.append(type)
    }
}

enum Coffee{
    case espresso
    case latte
    case ade
    case water
}
let coffeeMenu: [Coffee: Int] = [
    .espresso: 2500,
    .latte: 3500,
    .ade: 5000,
    .water: 500
]//메뉴 가격 설정

var misterLee: Person = Person()
var missKim: Person = Person()

var yagombucks: CoffeeShop = CoffeeShop(barista: misterLee, menu: coffeeMenu) // 바리스타와 메뉴 가격 할당
