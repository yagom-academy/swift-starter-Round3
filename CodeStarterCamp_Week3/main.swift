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
    
    func orderCoffee() {
        
    }
    
    func bringCoffee() {
        
    }
    
    func payMoney() {
        
    }
}

struct CoffeeShop {
    var isFranchise: Bool
    var isPickUpTable: Bool
    var totalSale: Int
    var menuCoffee = [String: Int]()
    
    func acceptOrderCoffee() {
        
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
