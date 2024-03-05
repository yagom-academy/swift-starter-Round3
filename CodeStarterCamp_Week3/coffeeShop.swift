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
    var barista: [Person]
    
    init(sales: Int, menu: [Coffee : Int], pickUpTable: [Coffee], barista: [Person]) {
        self.sales = sales
        self.menu = menu
        self.pickUpTable = pickUpTable
        self.barista = barista
    }
    
    func takeOrder(_ coffee: Coffee, from customer: String) {
        sales += menu[coffee] ?? 0
        
        print("------주문서------")
        print("주문자: \(customer)")
        print("주문내역: \(coffee)")
        print("----------------")
        print("현재 매출: \(sales)\n")

        make(coffee, from: customer)
    }
    
    func make(_ coffee: Coffee, from name: String) {
        let madeCoffee = coffee.rawValue
        pickUpTable.append(coffee)
        print("\(name) 님이 주문하신 \(madeCoffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요. - 바리스타 \(barista[0].name) - \n")
    }
}

enum Coffee: String {
    case espresso = "에스프레소"
    case americano = "아메리카노"
    case latte = "카페라떼"
    case vanillaLatte = "바닐라 라떼"
    case caramelMacchiato = "카라멜 마끼아또"
}
