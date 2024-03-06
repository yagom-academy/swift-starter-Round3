//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

var misterLee = Person(name: "Mr.Lee", money: 5000)
var missKim = Person(name: "Ms.Kim", money: 12000)
let yagombucks = CoffeeShop(name: "야곰벅스", totalSales: 0, menu: [.espresso: 4000, .americano: 5000, .cafeLatte: 5500, .cafeMocha: 6000, .vanillaLatte: 6000, .changeToIced: 0], pickUpTable: [], barista: misterLee)

missKim.order(.americano, of: yagombucks) // 주문 성공
// missKim.order(.espresso, of: yagombucks) // 추가 주문(잔액 및 매출액 계산 확인)
// misterLee.order(.cafeLatte, of: yagombucks, by: misterLee.name) // 주문 실패(잔액 부족)
// print("픽업대 현황: \(yagombucks.pickUpTable.joined(separator: ", "))")
