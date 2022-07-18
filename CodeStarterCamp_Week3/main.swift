//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee: String {
    case latte, cappuccino, americano, espresso, flatWhite, macchiato, mocha
}

class Person {
    var name: String
    var money: Int
    var favoriteCoffeeShop: CoffeeShop?
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    // 주문과 동시에 커피의 가격만큼 돈은 줄어들고. 매출액은 커피 가격만큼 증가.
    func order(_ coffee: Coffee) {
        print("[\(name)] \(coffee)를 주문하다")
        
        guard let price = favoriteCoffeeShop?.menu[coffee] else {
            return print("좋아하는 카페가 정해지지 않았거나, 해당 커피의 가격이 정해지지 않았습니다.")
            // return
        }
                
        if money < price {
            print("잔액이 \(price-money)만큼 부족합니다.")
        } else {
            money -= price
            favoriteCoffeeShop?.sales += price
            favoriteCoffeeShop?.make(coffee, from: name)
        }
    }
}

class CoffeeShop {
    var sales: Int = 0
    var barista: Person?
    var currentGuestName: String = ""
    var menu: [Coffee: Int] = [.americano: 2000, .cappuccino: 2500, .espresso: 1500, .flatWhite: 3000, .latte: 2500, .macchiato: 3000, .mocha: 2500 ]
    
    var beforeCount = 0
    
    var pickUpTable: [Coffee] = [] {
        willSet {
            // 값이 변경되기 직전에
            beforeCount = pickUpTable.count
        }
        didSet {
            // 값이 변경된 직후에
            if(beforeCount + 1 == pickUpTable.count) {
                print("\(currentGuestName) 님이 주문하신 \(pickUpTable[pickUpTable.count - 1])(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
            }
        }
    }
    
    func make(_ coffee: Coffee, from name: String) {
        currentGuestName = name
        pickUpTable.append(coffee)
    }
}

var missKim = Person(name: "missKim", money: 2000)
var coda = Person(name: "Coda", money: 11000)
var namu = Person(name: "namu", money: 5000)
var dasan = Person(name: "dasan", money: 3000)
var yagomBucks = CoffeeShop()

missKim.favoriteCoffeeShop = yagomBucks // yagomBucks가 struct라면, favoriteCoffeeShop에 값만 복사하는 것!!!
missKim.order(.flatWhite)

coda.favoriteCoffeeShop = yagomBucks
coda.order(.espresso)
coda.order(.mocha)

namu.favoriteCoffeeShop = yagomBucks
namu.order(.latte)
namu.order(.cappuccino)
namu.order(.espresso)

dasan.order(.espresso)
