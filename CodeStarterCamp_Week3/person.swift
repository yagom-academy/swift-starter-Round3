//
//  person.swift
//  CodeStarterCamp_Week3
//
//  Created by JSB on 2023/03/09.
//

struct Person {
    var haveMoney: Int
    var name: String

    //커피 주문하는 함수
    mutating func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        
        if let coffeePrice = coffeeShop.menu[coffee] {
            if checkHaveMoney(coffeePrice) {
                payMoney(coffeePrice)
                coffeeShop.doGetPaidMoney(coffeePrice)
                coffeeShop.make(coffee, for: name)
                takeCoffee(coffee, coffeeShop)
            }
            else {
                print("\(name)님의 잔액이 \(coffeePrice - self.haveMoney)원만큼 부족합니다.")
            }
        }
        else {
            print("해당 메뉴가 없습니다.")
        }
        
    }
    
    //잔액이 충분한지 확인하는 함수
    mutating func checkHaveMoney(_ coffeePrice: Int) -> Bool {
        if self.haveMoney >= coffeePrice {
            return true
        }
        return false
    }
    
    //커피값 내는 함수
    mutating func payMoney(_ coffeePrice: Int) {
        self.haveMoney -= coffeePrice
    }
    
    //커피를 pickUpTable에서 가져가는 함수
    func takeCoffee(_ coffee: Coffee, _ coffeeShop: CoffeeShop) {
        if let myCoffee = coffeeShop.pickUpTable.firstIndex(of: coffee.rawValue) {
            coffeeShop.pickUpTable.remove(at: myCoffee)
            print("커피를 가져갔습니다.")
        }
    }
    
}

