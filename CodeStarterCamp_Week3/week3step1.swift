//
//  Step 1.swift
//  CodeStarterCamp_Week3
//
//  Created by Minseong Kang on 2022/03/01.
//

import Foundation

class Person {
    var name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(something: String) {
        var inventory: Array<String> = []
        inventory.append(something)
        print("\(self.name)의 인벤토리에 \(something)이/가 추가되었습니다.")
    }
}
