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
	
	var pickupTable: (Coffee: Coffee, Person: Person)? {
		didSet {
			if let customer = pickupTable {
				print("\(customer.Person.name)님의 \(customer.Coffee.name) 준비되었습니다. 픽업대에서 가져가주세요. \n")
			}
		}
	}
	
	mutating func order(_ coffee: Coffee, _ customer: Person) {
		totalSales += coffee.price
		makeCoffee(coffee, customer)
	}
	
	mutating func makeCoffee(_ coffee: Coffee, _ customer: Person) {
		print("바리스타 : \(barista.name), \(customer.name)의 \(coffee.name)를 만듭니다.")
		pickupTable = (Coffee: coffee, Person: customer)
	}
}
