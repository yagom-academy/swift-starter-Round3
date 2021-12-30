//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

/*
Person 타입의 인스턴스로 misterLee , missKim 을 생성해봅시다.

CoffeeShop 타입의 인스턴스로 yagombucks 을 생성해봅시다.

yagombucks 의 바리스타(barista)를 misterLee 로 할당해봅시다.
*/

import Foundation

var misterLee : Person = Person()
var missKim : Person = Person()
var yagombucks : CoffeeShop = CoffeeShop(barista: misterLee)

