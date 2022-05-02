import Foundation

let missKim = Person(name: "미스 김", money: 10000)
let misterLee = Person(name: "미스터 이", money: 0)
let yagombucks = CoffeeShop(barista: misterLee)

missKim.order(coffee: .iceChoco, at: yagombucks)
