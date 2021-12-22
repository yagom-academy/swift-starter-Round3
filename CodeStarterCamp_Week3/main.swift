//  main.swift
//  CodeStarterCamp_Week3
//  Created by yagom
//  Copyright © yagom academy. All rights reserved

import Foundation

struct Person {
    let name: String
    let birthYear: Int
    var purse: Int?
    
    init(name: String, birthYear: Int) {
        self.name = name
        self.birthYear = birthYear
    }
    
    func buy(something: Any) {
        
    }
    
    func move(to: Any) {
        print("\(name)님이 \(to)로 이동합니다.")
    }
    
    func have(something: Any) {
        
    }
}
