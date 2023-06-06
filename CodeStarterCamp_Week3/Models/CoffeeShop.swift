//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 이지원 on 2023/06/03.
//

final class CoffeeShop {
    
    private var money = 0
    private(set) var pickUpTable: [Coffee] = []
    
    func takeOrder(to coffee: Coffee, completion: @escaping () -> Void) {
        money += coffee.price
        makeCoffee(to: coffee)
        completion()
    }
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        make(coffee, for: name)
    }
    
    private func make(_ coffee: Coffee, for name: String) {
        pickUpTable.append(coffee)
        print("\(name)님이 주문하신 \(coffee.name)(이/가) 준비되었습니다. 픽업대에서 가져가주세요")
    }
    
    private func makeCoffee(to coffee: Coffee) {
        pickUpTable.append(coffee)
    }
    
    init(money: Int) {
        self.money = money
    }
}
