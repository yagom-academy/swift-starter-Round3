import Foundation

struct CoffeeShop {
	var sales: Int = 0
	var menu = Coffee.allCases
	var pickupTable: Bool = false
	var barista: Person
	func order(_ coffee: Coffee) {
		print("\(coffee.fetchName()) 골랐군요!")
	}
	func makeCoffee(_ coffee: Coffee, barista: Person) {
		print("\(coffee.fetchName())를 만듭니다.")
	}
}

enum Coffee: CaseIterable {
	case americano, cafeLatte, dolceLatte, frappuccino
	var price: Int {
		switch self {
		case .americano:
			return 4800
		case .cafeLatte:
			return 5000
		case .dolceLatte:
			return 4900
		case .frappuccino:
			return 4900
		}
	}
	func fetchName() -> String {
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
