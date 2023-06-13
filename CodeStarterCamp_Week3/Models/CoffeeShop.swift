//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 이지원 on 2023/06/03.
//

final class CoffeeShop {
    
    private var money = 0
    private(set) var pickUpTable: [Coffee] = []
    
    var menu = [Coffee: Int]()
    
    func createNewMenu(coffee: Coffee, price: Int) {
        menu[coffee] = price
    }
    
    func checkOnSale(to coffee: Coffee) -> (Bool, Int) {
        let isSale = menu.contains(where: { $0.key == coffee })
        let price = menu[coffee]
        return (isSale, price ?? 0)
    }
    
    func takeOrder(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String, completion: @escaping () -> Void) {
        money += menu[coffee]!
        make(coffee, for: name)
        completion()
    }
    
    
    private func make(_ coffee: Coffee, for name: String) {
        pickUpTable.append(coffee)
        print("\(name)님이 주문하신 \(coffee.name)(이/가) 준비되었습니다. 픽업대에서 가져가주세요")
    }
    
    static func createCoffeeShop(money: Int, menu: [Coffee: Int]) -> CoffeeShop {
        let coffeeShop = CoffeeShop(money: money)
        coffeeShop.menu = menu
        return coffeeShop
    }
    
    private init(money: Int) {
        self.money = money
    }
}
