//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    let name: String
    let gender: Gender
    var nickname: String
    var age: Int
    var moneyOnHand: Int
    
    init(name: String, nickname: String, gender: Gender, age: Int, moneyOnHand: Int) {
        self.name = name
        self.nickname = nickname
        self.gender = gender
        self.age = age
        self.moneyOnHand = moneyOnHand
    }
    
    func orderCoffee(shop :CoffeeShop, drink: Coffee, drinkCount: Int) {
        print("주문할게요! \(drink) \(drinkCount)잔 주세요!")
        guard let price = shop.menuCoffeeAndPrice[drink.rawValue] else {
            print("주문하신 음료를 판매하지 않습니다.")
            return
        }
        shop.acceptOrderCoffee(drink: drink, count: drinkCount, price: price, money: self.moneyOnHand, name: self.name)
    }
}

enum Gender {
    case man
    case woman
}

class CoffeeShop {
    let isFranchise: Bool
    var isPickUpTable: Bool
    var totalSale = 0
    var barista: Array<String>
    var menuCoffeeAndPrice: Dictionary<String, Int>
    
    init(isFranchise: Bool, isPickUpTable: Bool, barista: Array<String>, menuCoffeeAndPrice: Dictionary<String, Int>) {
        self.isFranchise = isFranchise
        self.isPickUpTable = isPickUpTable
        self.barista = barista
        self.menuCoffeeAndPrice = menuCoffeeAndPrice
    }
    
    func acceptOrderCoffee(drink: Coffee, count: Int, price: Int, money: Int, name: String) {
        let makeTime = count * 2
        let totalPrice = count * price
        
        if totalPrice <= money {
            print("주문 받았습니다! \(drink) \(count)잔 준비해 드리겠습니다!")
            print("예상 시간 \(makeTime)분 입니다.")
            print("총 \(totalPrice)원 입니다.")
            self.totalSale += totalPrice
            makeCoffee(kindCoffee: drink, drinkCount: count, name: name)
        } else {
            let insufficient = totalPrice - money
            print("잔액이 \(insufficient)원 만큼 부족합니다.")
        }
    }
    
    func makeCoffee(kindCoffee: Coffee, drinkCount: Int, name: String) {
        let staffname = self.barista.randomElement() ?? "무인 커피숍"
        print("\(staffname) 파트너가 준비합니다.")
        print("주문하신 \(kindCoffee) \(drinkCount)잔 나왔습니다.")
        print("\(name) 님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

enum Coffee: String {
    case espresso = "에스프레소"
    case amricano = "아메리카노"
    case coldbrew = "콜드브루"
    case cafeLatte = "카페라떼"
    case caramelMacchiato = "카라멜마끼아또"
    case whiteChocolateMocha = "화이트초코라떼"
    case dolceLatte = "돌체라떼"
    case doubleEspressoChipFrappuccino = "더블에스프레소칩프라푸치노"
    case chocolateCreamChipFrappuccino = "초콜릿크림칩푸라푸치노"
    case javaChipFrappuccino = "자바칩푸라푸치노"
    case caramelFrappuccino = "카라멜푸라푸치노"
    case punchGraffitiBlended = "펀치그레피트블랜디드"
    case rollinMintChocoColdBrew = "롤린민트초콜릿브루"
    case pomeloFlowGreenTea = "포멜로그린티"
}

let missKim = Person(
    name: "김미스",
    nickname: "야곰여자친구",
    gender: .woman,
    age: 21,
    moneyOnHand: 6000
)

let yagombucks = CoffeeShop(
    isFranchise: true,
    isPickUpTable: true,
    barista: ["yagom", "TimCook"],
    menuCoffeeAndPrice: [
        Coffee.espresso.rawValue : 3000,
        Coffee.amricano.rawValue : 4500,
        Coffee.coldbrew.rawValue : 5500,
        Coffee.dolceLatte.rawValue : 6500,
    ]
)

missKim.orderCoffee(shop: yagombucks, drink: .cafeLatte, drinkCount: 1)
