import Foundation

struct Person {
	var money: Int
	init(money: Int) {
		self.money = money
	}
	func buy() {
		print("구입합니다.")
	}
}

struct CoffeeShop {
	var sales: Int = 0
	var menu = Coffee.allCases
	var pickupTable: Bool = false
	var barista: Person?
	func order(_ coffee: Coffee) {
		print("\(coffee.getName()) 골랐군요!")
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
	func getName() -> String {
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

var misterLee = Person(money: 100000)
var missKim = Person(money: 1000000)
var yagombucks = CoffeeShop()
yagombucks.barista = misterLee
