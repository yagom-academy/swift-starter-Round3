//
//  CoffeeMenu.swift
//  CodeStarterCamp_Week3
//
//  Created by 황지웅 on 2022/04/26.
//

import Foundation

class CoffeeMenu {
    private var coffeeListsInShop: [Coffee: Int] = [:]
    
    init(coffeeList: [Coffee: Int]) {
        coffeeListsInShop = coffeeList
    }
    
    func getPriceOfCoffee(coffee: Coffee) -> Int? {
        guard let coffeePrice = coffeeListsInShop[coffee] else {
            return nil
        }
        
        return coffeePrice
    }
}
