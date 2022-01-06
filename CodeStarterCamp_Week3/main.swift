//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var money: Int = 0
	
	func buyThings(things: String) {
		print("\(things)를 구매합니다.")
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

