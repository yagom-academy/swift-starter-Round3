import Foundation

struct CoffeeShop {
	var totalSales: Int
	var barista: Person
	let menuNames: [String] = Coffee.allCases.map{ String($0.name) }
	let menuPrices: [Int] = Coffee.allCases.map{ Int($0.price) }
	lazy var menu = Array(zip(menuNames, menuPrices))
	init(totalSales: Int, barista: Person){
		self.totalSales = totalSales
		self.barista = barista
	}
	var pickupTable: String = "" {
		didSet {
			print(pickupTable, "\n")
		}
	}
	mutating func order(_ coffee: Coffee, _ customersName: String) {
		totalSales += coffee.price
		makeCoffee(coffee, customersName)
	}
	mutating func makeCoffee(_ coffee: Coffee, _ customersName: String) {
		let coffeeName: String = "\(customersName) 님의 \(coffee.name)가 준비되었습니다. 픽업대에서 가져가주세요."
		pickupTable = coffeeName
	}
}
