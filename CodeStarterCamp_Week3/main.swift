//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//Person
let misterLee : Person? = Person(name: "misterLee", age: 28, money: 10000)
let missKim : Person? = Person(name: "missKim", age: 26, money: 10000)
missKim?.buySomeThings(things: "Americano") //메소드를 실행할때 또한 init?으로 nil이 나올수있기때문에 ?를 붙여준 모습이다.

//CoffeeShop
let yagombucks : CoffeShop = CoffeShop(revenue: 0, pickUpTable: true)//오늘 수입이 0원부터 시작하고, pickUpTable이 있는 yagombucks에 coffeshop타입을 할당해주었다.
yagombucks.showCoffeePrint(.Americano)
yagombucks.makeCoffee(.Americano)
yagombucks.barista = misterLee//바리스타 할당
