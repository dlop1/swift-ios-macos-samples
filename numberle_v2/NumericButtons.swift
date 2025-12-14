//
//  NumericButtons.swift
//  Lopatecki_lab3
//
//  Created by Dominik Lopatecki on 07/12/2023.
//

import SwiftUI

struct NumericButtons: View{
    @ObservedObject var myModel: MyModel
    
    var body: some View {
        VStack{
            ForEach(0..<2){ item in
                HStack{
                    ForEach(0..<5){ itemIn in
                        Button(action: {myModel.numericPress(item*5 + itemIn)}){
                            Text("\(item*5 + itemIn)")
                        }
                    }
                }
            }
        }
    }
}

struct NumericButtons_Previews: PreviewProvider {
    static var previews: some View {
        NumericButtons(myModel: MyModel())
    }
}
