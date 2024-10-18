//
//  Coffee.swift
//  CodeStarterCamp_Week3
//
//  Created by 최범수 on 2024-10-07.
//

enum Coffee {
    case americano
    case cafeLatte
    case cappuccino
    case espresso
    case latte
    case macchiato
    case latteEspresso
    case latteMacchiato
    case water
    case milk
    
    var name: String {
        switch self {
        case .americano:
            return "아메리카노"
        case .cafeLatte:
            return "카페라떼"
        case .cappuccino:
            return "카푸치노"
        case .espresso:
            return "에스프레소"
        case .latte:
            return "라떼"
        case .macchiato:
            return "마끼야또"
        case .latteEspresso:
            return "라떼에스프레소"
        case .latteMacchiato:
            return "라떼마끼야또"
        case .water:
            return "물"
        case .milk:
            return "우유"
        }
    }
    
    var price: Int {
        switch self {
        case .americano:
            return 1000
        case .cafeLatte:
            return 1500
        case .cappuccino:
            return 2000
        case .espresso:
            return 3000
        case .latte:
            return 4000
        case .macchiato:
            return 5000
        case .latteEspresso:
            return 6000
        case .latteMacchiato:
            return 7000
        case .water:
            return 500
        case .milk:
            return 1000
        }
    }
    
    var englishName: String {
        switch self {
        case .americano:
            return "americano"
        case .cafeLatte:
            return "cafeLatte"
        case .cappuccino:
            return "cappuccino"
        case .espresso:
            return "espresso"
        case .latte:
            return "latte"
        case .macchiato:
            return "macchiato"
        case .latteEspresso:
            return "latteEspresso"
        case .latteMacchiato:
            return "latteMacchiato"
        case .water:
            return "water"
        case .milk:
            return "milk"
        }
    }
}
