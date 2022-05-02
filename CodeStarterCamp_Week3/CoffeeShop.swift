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
