//
//  MyModel.swift
//  Lopatecki_lab3
//
//  Created by Dominik Lopatecki  on 07/12/2023.
//

import SwiftUI

typealias Values =  (number: Int, background: Color)

class MyModel: ObservableObject{
    private var numToGuess: [Int] = [1, 2, 3, 4, 5]
    @Published var currColumn: Int = 0
    @Published var fields: [Values] = []
    
    init(){
        for _ in 0...4{
            fields += [(-1, Color.white)]
        }
    }
    
    func numericPress(_ number: Int){
        fields[currColumn].number = number;
    }
    
    func clearPress(){
        fields[currColumn].number = -1
    }
    
    func newGame(){
        currColumn = 0
        for column in 0...4{
            fields[column].number = -1
            fields[column].background = Color.white
        }
    }
    
    func check(){
        for (i, field) in fields.enumerated(){
            if checkIfNoEmptyFields(){
                if field.number == numToGuess[i]
                {
                    fields[i].background = Color.green
                }
                else if numToGuess.contains(field.number){
                    fields[i].background = Color.yellow
                }
                else {
                    fields[i].background = Color.gray
                }
            }
        }
    }
    
    func checkIfNoEmptyFields() -> Bool {
        for field in fields{
            if field.number == -1{
                return false
            }
        }
        return true
    }
    
}
