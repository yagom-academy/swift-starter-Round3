//
//  TableInfo.swift
//  CodeStarterCamp_Week3
//
//  Created by 이정민 on 2022/05/02.
//

import Foundation

struct PickUpTableInfo {
    let customer: String
    let coffee: Coffee
    
    init(customer: String, coffee: Coffee) {
        self.customer = customer
        self.coffee = coffee
    }
}
