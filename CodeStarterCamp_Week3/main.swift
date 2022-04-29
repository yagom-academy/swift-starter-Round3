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
	var menu: [String] = ["커피 종류", "가격"]
	var pickupTable: Bool = false
	var barista: Person?
	func order(_ coffee: Coffee) {
		print("\(coffee.rawValue) 골랐군요!")
	}
}

enum Coffee: String {
	case hotAmericano = "핫 아메리카노"
	case iceAmericano = "아이스 아메리카노"
	case hotCafeLatte = "핫 카페라떼"
	case iceCafeLatte = "아이스 카페라떼"
	case hotDolceLatte = "핫 돌체라떼"
	case iceDolceLatte = "아이스 돌체라떼"
	case Frappuccino = "프라푸치노"
}

var misterLee = Person(money: 100000)
var missKim = Person(money: 1000000)
var yagombucks = CoffeeShop()
yagombucks.barista = misterLee
