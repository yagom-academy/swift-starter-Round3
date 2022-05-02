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
