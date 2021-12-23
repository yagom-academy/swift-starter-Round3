//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var asset: Int
    func purchaseSomeThing(price: Int) -> Int {
        let remainder = asset - price
        return remainder
    }
}
