//
//  ColumnPicker.swift
//  Lopatecki_lab3
//
//  Created by Dominik Lopatecki on 07/12/2023.
//

import SwiftUI

struct ColumnPicker: View{
    @ObservedObject var myModel: MyModel

    var body: some View {
        Picker("", selection: $myModel.currColumn){
            Spacer().tag(0)
            Spacer().tag(1)
            Spacer().tag(2)
            Spacer().tag(3)
            Spacer().tag(4)
        }
        .frame(width: 220, height: 25)
        .pickerStyle(.segmented)
    }
}

struct ColumnPicker_Previews: PreviewProvider {
    static var previews: some View {
        ColumnPicker(myModel: MyModel())
    }
}
