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
    let menuList: [Coffee: Int] = [.americano: 4000, .latte: 4500, .milkTea: 4500, .vanillaLatte: 5000]
    var pickUpTable: Bool = false
    var barista: Person?
    
    func getOrder() {
        if let worker = barista {
            print("\(worker.name): 무엇을 주문하시겠습니까?")
        }
    }

    func makeCoffee() {
        if let worker = barista {
            print("\(worker.name)이(가) 커피를 만들고 있습니다.")
        }
    }
}

enum Coffee {
    case americano, latte, milkTea, vanillaLatte
}

var misterLee = Person(name: "misterLee", money: 10000)
var missKim = Person(name: "missKim", money: 10000)

var yagombucks = CoffeeShop(barista: misterLee)

missKim.buyCoffee()
yagombucks.getOrder()
yagombucks.makeCoffee()
