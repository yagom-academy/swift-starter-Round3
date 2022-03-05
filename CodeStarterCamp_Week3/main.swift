//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee {
    case americano
    case cafeLatte
    case vanilaLatte
    case cafeMoca
    case chocoLatte
}

struct Person {
    var money: Int
    
    mutating func buyStuff(price: Int) {
        if money >= price {
            print("\(price)를 내고 구매하였습니다!")
            money -= price
        } else {
            print("열심히 일해서 돈을 더 법시다!")
        }
    }
}
