import Foundation

enum Size {
    case small
    case medium
    case large

    var orderBySize: String {
        get {
            switch self {
            case .small:
                return "스몰"
            case .medium:
                return "미디엄"
            case .large:
                return "라지"
            }
        }
    }

    var priceBySize: Int {
        get {
            switch self {
            case .small:
                return 0
            case .medium:
                return 500
            case .large:
                return 1000
            }
        }
    }
}

enum IceOrHot {
    case ice
    case hot

    var orderIceOrHot: String {
        get {
            switch self {
            case .ice:
                return "아이스"
            case .hot:
                return "핫"
            }
        }
    }

    var priceByIceOrHot: Int {
        get {
            switch self {
            case .ice:
                return 300
            case .hot:
                return 0
            }
        }
    }
}
