//
//  Container.swift
//  Lopatecki_lab1
//
//  Created by Dominik Łopatecki on 02/11/2023.
//

import Foundation

class Container{
    let uuid = UUID().uuidString
    var root: Node?
    
    init(){
        print("Container initialized")
    }
    
    deinit{
        print("Container deinitialized")
    }
    
    func add(_ data: Any, _ key: Int)
    {
        let newNode = Node(data, key)
        
        if self.root == nil {
            self.root = newNode
        }
        else {
            self.root?.addChild(newNode)
        }
    }
    
    func drawContainer(){
        self.root?.drawNode()
    }
}
