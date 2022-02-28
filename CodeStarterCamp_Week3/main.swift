//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//Person 인스턴스
let misterLee : Person? = Person(name: "misterLee", age: 28, money: 10000) //Person타입에 ?를 붙여서 misterLee라는 사람을 할당했다.
let missKim : Person? = Person(name: "missKim", age: 26, money: 10000)

//CoffeeShop 인스턴스 및 상속
let yagombucks : CoffeeShop = CoffeeShop()//오늘 수입이 0원부터 시작하고, pickUpTable이 있는 yagombucks에 coffeshop타입을 할당해주었다.

yagombucks.showCoffeePrint(.Americano)//가격출력
yagombucks.barista = misterLee//바리스타 할당
yagombucks.customer = missKim//손님 할당



missKim?.order(.Americano) //yagombucks의 매출이 올라간 모습까지 확인가능
missKim?.order(.Americano)
yagombucks.pickUpTable(ready: true )
