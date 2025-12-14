//
//  Node.swift
//  Lopatecki_lab1
//
//  Created by Dominik Łopatecki on 02/11/2023.
//

import Foundation

class Node{
    let key: Int
    var greater: Node?
    var smallerAndEqual: Node?
    let data: Any
    let uuid = UUID().uuidString
    weak var upper: Node?
    
    init(_ data: Any, _ key: Int){
        self.data = data
        self.key = key
        print("Node initialized with key \(self.key)")
    }
    
    deinit {
        print("Node deinitialized with key \(self.key)")
    }
    
    func addChild(_ child: Node){
        if child.key <= self.key {
            if self.smallerAndEqual == nil{
                self.smallerAndEqual = child
                self.smallerAndEqual?.setParent(self)
            }
            else{
                self.smallerAndEqual?.addChild(child)
            }
        }
        else{
            if self.greater == nil{
                self.greater = child
                self.greater?.setParent(self)
            }
            else{
                self.greater?.addChild(child)
            }
        }
    }
    
    func drawNode(){
        self.smallerAndEqual?.drawNode()
        self.greater?.drawNode()
        print("Key: \(self.key), Data: \(self.data)")
    }
    
    func setParent(_ parent: Node){
        self.upper = parent
    }
}
