//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

////Person 인스턴스(customer , barista에 할당)
let misterLee : Barista? = Barista(name: "misterLee", age: 28, money: 10000)
let missKim : Customer? = Customer(name: "missKim", age: 26, money: 10000)
let yagombucks : CoffeeShop = CoffeeShop()//오늘 수입이 0원부터 시작하고, pickUpTable이 있는 yagombucks에 coffeshop타입을 할당해주었다.
yagombucks.barista = misterLee//바리스타 할당
yagombucks.customer = missKim//손님 할당
misterLee?.cafe = yagombucks
missKim?.cafe = yagombucks

yagombucks.showCoffeePrint(.Americano)//가격출력

missKim?.cafe?.order(.Americano) //yagombucks의 매출이 올라간 모습까지 확인가능
missKim?.cafe?.order(.Americano)
missKim?.cafe?.order(.Americano) //missKim이 세잔을 주문할 잔액이 부족하다는 것을 호출해줌
misterLee?.cafe?.pickUpTable(ready: true ) //바리스타가 음료가 완료됐다는 것을 알려줌.
