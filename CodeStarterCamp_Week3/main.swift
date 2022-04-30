import Foundation

let misterLee = Person(name: "미스터 이", money: 5000)
let missKim = Person(name: "미스 김", money: 10000)
let yagomBucks = CoffeeShop(sales: 500000, barista: misterLee)

misterLee.buyCoffee(.americano)
