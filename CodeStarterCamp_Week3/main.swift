import Foundation

let misterLee: Person = Person(name: "미스터 이", money: 5000)
let missKim: Person = Person(name: "미스 김", money: 10000)
let yagomBucks: CoffeeShop = CoffeeShop(sales: 500000, barista: misterLee)

misterLee.buyCoffee(.americano)
