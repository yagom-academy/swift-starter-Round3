import Foundation

enum CoffeeMenu {
    case americano
    case capouccino
    case latte

    var coffeeMenuInKorean: String {
        get {
            switch self {
            case .americano:
                return "아메리카노"
            case .capouccino:
                return "카푸치노"
            case .latte:
                return "라떼"
            }
        }
    }
}
