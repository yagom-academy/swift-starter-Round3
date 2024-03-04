//
//  coffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by CHYUN on 3/1/24.
//

import Foundation

enum Coffee {
    case americano,
         cafeLatte,
         chocolateLatte,
         coldBrew
}

struct Menu {
    let americano = ("아메리카노", 4500)
    let cafeLatte = ("카페라떼", 4700)
    let chocloateLatte = ("초콜릿라떼", 5500)
    let coldBrew = ("콜드브루", 5000)
}

class CoffeeShop {
    var brista: Person
    var totalSales = 0
    var order : (String, (String, Int))? = nil
    var pickupTable = Array<Coffee>()
    let menu = Menu()
    
    init(brista: Person) {
        self.brista = brista
    }
    
    func takeCoffeeOrder(nickName customer: String, coffee: Coffee) -> Int {
        let menu = findoutPrice(coffee: coffee)
        order = (customer, menu)
        print("안녕하세요 \(customer)님, 주문하신 \(menu.0)는 \(menu.1)원입니다.")
        return menu.1
    }
    
    func findoutPrice(coffee: Coffee) -> (String, Int) {
        switch coffee {
        case Coffee.americano :
            return menu.americano
        case Coffee.cafeLatte :
            return menu.cafeLatte
        case Coffee.chocolateLatte :
            return menu.chocloateLatte
        case Coffee.coldBrew :
            return menu.coldBrew
        }
    }
    
    
    func processPayment(paidMoney: Int) {
        if let order {
            let price = order.1.1
            if paidMoney == price {
                totalSales += paidMoney
                print("결제되었습니다. 닉네임으로 불러드리겠습니다.")
            } else {
                print("\(price - paidMoney)원이 부족합니다.")
            }
        } else {
            print("주문을 먼저 해야합니다.")
        }
    }
    
    func makeCoffee() {
        if order != nil {
            let nickName = order!.0
            let coffee = order!.1.0
            
            switch coffee {
            case menu.americano.0 :
                pickupTable.append(Coffee.americano)
            case menu.cafeLatte.0 :
                pickupTable.append(Coffee.cafeLatte)
            case menu.chocloateLatte.0 :
                pickupTable.append(Coffee.chocolateLatte)
            case menu.coldBrew.0 :
                pickupTable.append(Coffee.coldBrew)
            default:
                print("판매하지 않는 메뉴입니다.")
            }
            print("\(nickName)님, 주문하신 \(coffee) 나왔습니다.")
        } else {
            print("주문을 먼저 해주세요.")
        }
    }
}
