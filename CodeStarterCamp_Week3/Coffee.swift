import Foundation

enum Coffee: CaseIterable {
	case americano, cafeLatte, dolceLatte, frappuccino
	var price: Int {
		switch self {
		case .americano:
			return 4500
		case .cafeLatte:
			return 5000
		case .dolceLatte:
			return 5900
		case .frappuccino:
			return 6300
		}
	}
	var name: String {
		switch self {
		case .americano:
			return "아메리카노"
		case .cafeLatte:
			return "카페라떼"
		case .dolceLatte:
			return "돌체라떼"
		case .frappuccino:
			return "프라푸치노"
		}
	}
}
