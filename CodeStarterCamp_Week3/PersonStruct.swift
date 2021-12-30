//
//  PersonStruct.swift
//  CodeStarterCamp_Week3
//
//  Created by 김동욱 on 2021/12/30.
//

import Foundation

/*
 Person 타입을 정의합니다.
 
 사람이 공통적으로 가지는 특성을 프로퍼티로 정의해봅시다.
 돈이라는 속성을 가질 수 있도록 해봅시다.
 사람이 공통적으로 할 수 있는 동작을 메서드로 정의해봅시다.
 물건을 구매할 수 있도록 메서드를 정의해봅시다.
 */

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
