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
    var menuCoffeeAndPrice = [String: Int]()
    
    func acceptOrderCoffee(kindCoffee: String, drinkCount: Int, coffeePrice: Int) {
        let makeTime = drinkCount * 2
        let totalPrice = drinkCount * coffeePrice
        
        print("주문 받았습니다! \(kindCoffee) \(drinkCount)잔 준비해 드리겠습니다!")
        print("예상 시간 \(makeTime)분 입니다.")
        print("총 \(totalPrice)원 입니다.")
    }
    
    func isMakeCoffee() {
        
    }
}

enum Coffee {
    case espresso
    case amricano
    case coldbrew
    case cafeLatte
    case caramelMacchiato
    case whiteChochlateMocha
    case dolceLatte
    
    case doubleEspressoChipFrappuccino
    case chocolateCreamChipFrappuccino
    case javaChipFrappuccino
    case caramelFrappuccino
    
    case punchGraffitiBlended
    case rollinMintChocoColdBrew
    case pomeloFlowGreenTea
}
