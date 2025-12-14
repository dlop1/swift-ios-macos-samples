//
//  FieldsDisplay.swift
//  Lopatecki_lab3
//
//  Created by Dominik Lopatecki on 07/12/2023.
//

import SwiftUI

struct FieldsDisplay: View{
    @ObservedObject var myModel: MyModel
    
    var body: some View {
        HStack{
            ForEach(0..<5){ item in
                Text(myModel.fields[item].number != -1 ? "\(myModel.fields[item].number)" : "")
                    .font(.largeTitle)
                    .frame(width: 35, height: 35)
                    .background(myModel.fields[item].background)
                    .border(Color.black, width: 1)
            }
        }
    }
}

struct FieldsDisplay_Previews: PreviewProvider {
    static var previews: some View {
        FieldsDisplay(myModel: MyModel())
    }
}
