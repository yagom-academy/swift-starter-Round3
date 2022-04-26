//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var gender: String
    var age: Int
    var nickname: String
    var money: Int
    var pointLevel: Int

    func orderCoffee(drink: String, manyDrink number: Int) -> ([String: Int]) {
        print("주문할게요! \(drink) \(number)잔 주세요!")
        return [drink: number]
    }
}

struct CoffeeShop {
    var isFranchise: Bool
    var isPickUpTable: Bool
    var yearTotalSale: Int
    var staff: Array<String>
    var menuCoffeeAndPrice: Dictionary<String, Int>
    
    func acceptOrderCoffee(kindCoffee: String, drinkCount: Int, coffeePrice: Int) {
        let makeTime = drinkCount * 2
        let totalPrice = drinkCount * coffeePrice
        
        print("주문 받았습니다! \(kindCoffee) \(drinkCount)잔 준비해 드리겠습니다!")
        print("예상 시간 \(makeTime)분 입니다.")
        print("총 \(totalPrice)원 입니다.")
    }
    
    func isMakeCoffee(kindCoffee: String, drinkCount: Int) {
        let staffname = self.staff.randomElement() ?? "무인 커피숍"
        print("\(staffname) 파트너가 준비합니다.")
        print("만...드...는...중...")
        print("주문하신 \(kindCoffee) \(drinkCount)잔 나왔습니다.")
    }
}

enum Coffee : String {
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
