import Foundation

let missKim = Person(name: "미스 김", money: 500000)
let misterLee = Person(name: "미스터 이", money: 0)
var yagombucks = CoffeeShop(consumer: missKim, barista: misterLee)

yagombucks.takeOrder(consumer: missKim, coffee: .americano, barista: misterLee)
