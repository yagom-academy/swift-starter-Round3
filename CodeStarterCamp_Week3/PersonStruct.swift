//
//  PersonStruct.swift
//  CodeStarterCamp_Week3
//
//  Created by 김동욱 on 2021/12/30.
//

import Foundation

struct Person {
    var name : String = ""
    var haveMoney : Int = 10000
    var job : String = ""
    
    mutating func buyIt (buy : String, price: Int) {
        let buyItItem : [String : Int] = [:]
        guard let ItemPrice = buyItItem[buy] else { return }
        haveMoney -= ItemPrice
    }
}
