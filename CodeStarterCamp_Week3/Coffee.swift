//
//  Coffee.swift
//  CodeStarterCamp_Week3
//
//  Created by Jiyoung Lee on 2022/05/07.
//

import Foundation

enum Coffee {
    case americano, latte, mocha
    
    var coffeeString: String {
        String(describing: self)
    }
}
