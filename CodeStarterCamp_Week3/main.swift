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
        
        if let price = favoriteCoffeeShop?.menu[coffee] {
            money -= price
            if money < 0 {
                print("잔액이 \(-money)만큼 부족합니다.")
            } else {
                favoriteCoffeeShop?.sales += price
                favoriteCoffeeShop?.make(coffee, from: name)
            }
        } else {
            print("해당 커피의 가격이 정해지지 않았습니다.")
        }
    }
}

class CoffeeShop {
    var sales: Int = 0
    var barista: Person?
    var currentGuestName: String = ""
    var menu: [Coffee: Int] = [.americano: 2000, .cappuccino: 2500, .espresso: 1500, .flatWhite: 3000, .latte: 2500, .macchiato: 3000, .mocha: 2500 ]
    var pickUpTable: [Coffee] = [] {
        didSet {
            let index = pickUpTable.count - 1
            print("\(currentGuestName) 님이 주문하신 \(pickUpTable[index])(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
    
    func make(_ coffee: Coffee, from name: String) {
        currentGuestName = name
        pickUpTable.append(coffee)
    }
}

var missKim = Person(name: "missKim", money: 2000)
var coda = Person(name: "Coda", money: 11000)
var yagomBucks = CoffeeShop()

//print(missKim.money)
//print(coda.money)
//print(yagomBucks.sales)

missKim.favoriteCoffeeShop = yagomBucks // yagomBucks가 struct라면, favoriteCoffeeShop에 값만 복사하는 것!!!
missKim.order(.flatWhite)

coda.favoriteCoffeeShop = yagomBucks
coda.order(.espresso)

//print(missKim.money)
//print(coda.money)
// CoffeeShop이 struct인 경우 아래 값은 전혀 다르다.
//print(yagomBucks.sales)
//print(missKim.favoriteCoffeeShop?.sales)


/*
 
// CoffeeShop이 struct 타입일 경우.
struct CoffeeShop {
    var sales: Int = 0
    var menu: [Coffee: Int] = [.americano: 2000, .cappuccino: 2500, .espresso: 1500, .flatWhite: 3000, .latte: 2500, .macchiato: 3000, .mocha: 2500 ]
    var pickUpTable: [Coffee] = [] {
        didSet {
            // name님이 주문하신 메뉴(이/가) 준비되었습니다. 픽업대에서 가져가주세요.
        }
    }
    var barista: Person?
            
    mutating func make(_ coffee: Coffee, from name: String) {
        if let price = menu[coffee] {
            print("[CoffeeShop]: \(name)에게 \(coffee) 주문을 받았다.")
            print("\(name)님, \(coffee)는 \(price)원 입니다.")
            //sales += price
            //print(sales)
            pickUpTable.append(coffee)
        } else {
            print("해당 커피의 가격이 정해지지 않았습니다.")
        }

    }
}
 
missKim.favoriteCoffeeShop = yagomBucks // yagomBucks의 값을 favoriteCoffeeShop에 값만 복사하는 것!!!
print(yagomBucks.sales)
print(missKim.favoriteCoffeeShop?.sales)
 
// 위의 두개 값은 완전 다르다! sales의 값을 변경하는 것은 favoriteCoffeeShop이므로 (CoffeeShop 코드에서 아무리 sales값을 수정하여도)
// yagomBucks의 sales의 값에 전혀 영향을 미치지 않는다.
 
*/

