//
//  coffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 이지은 on 2/24/24.
//

class CoffeeShop {
    var sales: Int
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee]
    var barista: String
    
    init(sales: Int, menu: [Coffee : Int], pickUpTable: [Coffee], barista: String) {
        self.sales = sales
        self.menu = menu
        self.pickUpTable = pickUpTable
        self.barista = barista
    }
    
    func take(order coffee: Coffee, from name: String) {
        sales += menu[coffee] ?? 0
        print("현재 매출: \(sales)")
        make(coffee, from: name)
    }
    
    func make(_ coffee: Coffee, from name: String) {
        let madeCoffee = coffee.rawValue
        pickUpTable.append(coffee)
        print("\(name) 님이 주문하신 \(madeCoffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요. - 바리스타 \(barista) - \n")
    }
}

enum Coffee: String {
    case espresso = "에스프레소"
    case americano = "아메리카노"
    case latte = "카페라떼"
    case vanillaLatte = "바닐라 라떼"
    case caramelMacchiato = "카라멜 마끼아또"
}
