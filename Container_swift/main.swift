//
//  main.swift
//  Lopatecki_lab1
//
//  Created by Dominik Łopatecki on 02/11/2023.
//

import Foundation

var container: Container? = Container()

container?.add(true, 3)
container?.add(3, 5)
container?.add("ABC", 2)
container?.add(false, 3)
container?.add(10, 5)
container?.add("DEF", 2)

container?.drawContainer()

container = nil


