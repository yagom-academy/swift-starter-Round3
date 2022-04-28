//
//  enumCoffeeMenu.swift
//  CodeStarterCamp_Week3
//
//  Created by 홍승주 on 2022/04/28.
//

import Foundation

enum Coffee: String {
   case 아메리카노, 에스프레소, 바닐라라떼, 복숭아스무디, 아인슈패너, 카페라떼, 딸기스무디, 시그니쳐초콜릿
}
var menu: [Coffee: Int] = [.아메리카노: 4000, .에스프레소: 2500, .바닐라라떼: 4500, .복숭아스무디: 5000, .아인슈패너: 5000, .카페라떼: 4500, .딸기스무디: 5000, .시그니쳐초콜릿: 6000]
