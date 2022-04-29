//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 황지웅 on 2022/04/26.
//

import Foundation

class CoffeeShop {
    var barista: Barista? = nil
    var coffeeMenu: CoffeeMenu
    var salesMoney: Int
    var pickUpTable: PickUpTable = PickUpTable()
    
    init(coffeeMenu: CoffeeMenu) {
        salesMoney = 0
        self.coffeeMenu = coffeeMenu
    }
    
    func hireBarista(barista: Barista) {
        self.barista = barista
    }
    
    func depositMoney(coffeePrice: Int) {
        salesMoney += coffeePrice
    }
    
    func insertOrderToPickUpTable(orderMan: String, coffee: Coffee) {
        pickUpTable.insertOrderToPickUpTable(name: orderMan, coffee: coffee)
    }
    
    func order(coffee: Coffee) {
        let coffeePrice = coffeeMenu.getPriceOfCoffee(coffee: coffee)
        if coffeePrice == CoffeeMenuError.notExistCoffee.rawValue {
            print("존재하지 않는 커피 메뉴입니다.")
            return
        }
        
        depositMoney(coffeePrice: coffeePrice)
        barista?.makeCoffeeOrderFromShop(coffee: coffee)
    }
}

extension CoffeeShop: Shop {
    func insertCoffeeToPickUpTable(coffee: Coffee) {
        pickUpTable.releasePickUpTable(coffee: coffee)
    }
}
