//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by Nat Kim on 2023/12/11.
//

import Foundation

// MARK: STEP2

// MARK: - 주문 픽업
var missKim: Person = Person(job: PersonRole(roleType: "customer"), money: 6000)
var yagomBucks: CoffeeShop = .init(
    sales: 0,
    menu: [
        .americano: 3000,
        .cafeLatte: 4000,
        .cafeMocha: 4500,
        .cappuchino: 4500,
        .machiatto: 5000,
        .espresso: 2800
    ]
)
// MARK: - 커피 주문
missKim.order(.cappuchino, of: &yagomBucks, by: "missKim")
// MARK: - 카페 매출액 증가 확인
print("yagombucks의 매출액이 \(yagomBucks.sales)원 만큼 증가했습니다.")
// MARK: - 잔액 모자른 case
missKim.order(.americano, of: &yagomBucks, by: "missKim")
