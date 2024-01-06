//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let misterLee = Employee(name: "Lee", money: 10_000)
let missKim = Customer(name: "Kim", money: 30_000)

misterLee.checkBalance()
missKim.checkBalance()

print("\n**************************************************\n")
operateCoffeeShop()
print("\n**************************************************\n")

misterLee.checkBalance()
missKim.checkBalance()

func operateCoffeeShop() {
  let yagombucks = CoffeeShop(name: "yagombucks", barista: misterLee)
  missKim.placeOrder(.americano, of: yagombucks)
  missKim.placeOrder(.caffeLatte, of: yagombucks)
}
