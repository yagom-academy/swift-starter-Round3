import Foundation

struct Person {
    var money: Int = 0
	
	func buy() {
		
	}
}

struct CoffeeShop {
	var revenue: Int = 0
	var menu = [String : Int]()
	var pickUpTable: String = ""
	var barista: String = ""

	mutating func order(coffee: String) {
		makeCoffee(coffee: coffee)
	}

	mutating func makeCoffee(coffee: String) {
		pickUpTable = coffee
	}
}

enum Coffee: String {
    case americano
	case caffeLatte
	case cappuccino
}

var misterLee: Person = Person()
var missKim: Person = Person()
var yagombucks: CoffeeShop = CoffeeShop()

yagombucks.barista = "misterLee"


