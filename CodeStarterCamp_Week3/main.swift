//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    var money: Int

    func buyCoffee() {
        print("\(money)원으로 커피를 사먹자.")
    }
}

struct CoffeeShop {
    var sales: Int = 0
    enum Coffee {
        case americano, latte, milkTea, vanillaLatte
    }
    let menuList: [Coffee: Int] = [.americano: 4000, .latte: 4500, .milkTea: 4500, .vanillaLatte: 5000]
    var pickUpTable: Bool = false
    var barista: Person!
    
    func order() {
        if let worker = barista {
            print("\(worker.name): 무엇을 주문하시겠습니까?")
        }
    }

    func makeCoffee() {
        print("커피를 만들고 있습니다.")
    }
    
    func giveCoffee() {
        if pickUpTable == true {
            print("음료가 준비되었습니다.")
        }
    }
}

let misterLee = Person(name: "misterLee", money: 10000)
let missKim = Person(name: "missKim", money: 10000)
var yagombucks = CoffeeShop(barista: misterLee)
yagombucks.pickUpTable = true

missKim.buyCoffee()
yagombucks.order()
yagombucks.makeCoffee()
yagombucks.giveCoffee()
