//
//  coffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by daekyo on 2023/10/24.
//

import Foundation

enum Coffee: String {
    case americano, iceAmericano, cafeLatte, hotChoco, vanillaLatte
    
    var name: String {
        switch self {
        case .americano: return "아메리카노"
        case .iceAmericano: return "아이스아메리카노"
        case .cafeLatte: return "카페라떼"
        case .hotChoco: return "핫초쿄"
        case .vanillaLatte: return "바닐라라떼"
        }
    }
}

class CoffeeShop {
    var salesAmount: Int = 0
    var menuPan: [Coffee: Int] = [:]
    var barista: Person
    var pickUpTable: [[Coffee: String]] = [[:]] {
        didSet {
            if let pickuptable = pickUpTable.last {
                for (coffee, name) in pickuptable {
                    print("\(name) 님이 주문하신 \(coffee.name)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
                }
            }
        }
    }
    
    init(barista: Person) {
        self.barista = barista
    }
    
    func takeOrderFor(coffee: Coffee, by person: Person) {
        person.money -= menuPan[coffee] ?? 0
        self.salesAmount += menuPan[coffee] ?? 0
        
        make(coffee: coffee, from: person.name)
    }
    
    func make(coffee: Coffee, from name: String) {
        putOnTableFor(coffee: coffee, from: name)
    }
    
    func putOnTableFor(coffee: Coffee, from name: String) {
        let makedCoffee = [coffee: name]
        pickUpTable.append(makedCoffee)
    }
}
