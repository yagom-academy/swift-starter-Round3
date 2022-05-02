import Foundation

let missKim = Person(name: "미스 김", money: 50000)
let misterLee = Person(name: "미스터 이", money: 0)
let yagombucks = CoffeeShop(consumer: missKim, barista: misterLee)

missKim.order(coffee: .americano, at: yagombucks)
