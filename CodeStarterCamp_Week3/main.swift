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
    
    init (name: String, money: Int){
        self.name = name
        self.money = money
    }
    
    func buyItem(someItem: String) {
        print("\(someItem)을(를) 구입하셨습니다.")
    }
}

