//
//  ContentView.swift
//  Lopatecki_lab3
//
//  Created by Dominik Lopatecki on 07/12/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var myModel: MyModel
    
    var body: some View {

        VStack{
            FieldsDisplay(myModel: myModel)
                .padding(5)
            
            ColumnPicker(myModel: myModel)
                .padding(5)
            
            NumericButtons(myModel: myModel)
                .padding(10)
            
            FuncButtons(myModel: myModel)
                .padding(5)
        }
        .padding(10)
        .background(Color.blue)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(myModel: MyModel())
    }
}
