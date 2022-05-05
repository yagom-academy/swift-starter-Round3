import Foundation

struct Person {
	let name: String
	var money: Int
	
	mutating func buy(shop: inout CoffeeShop, coffee: Coffee) {
		if money < coffee.price {
			print("잔액이 \(coffee.price - money)원만큼 부족합니다.")
		} else {
			money -= coffee.price
			shop.order(coffee, name)
		}
	}
}
