//
//  FuncButtons.swift
//  Lopatecki_lab3
//
//  Created by Dominik Lopatecki on 07/12/2023.
//

import SwiftUI

struct FuncButtons: View{
    @ObservedObject var myModel: MyModel

    var body: some View {
        VStack{
            HStack{
                Button(action: {myModel.clearPress()}){
                    Text("Clear")
                }
                
                Spacer()
                .frame(width: 30, height: 1)
                
                Button(action: {myModel.check()}){
                    Text("Check")
                }
                
            }
            Spacer()
            .frame(width: 1, height: 10)
            
            Button(action: {myModel.newGame()}){
                Text("New Game")
            }
        }
    }
}

struct FuncButtons_Previews: PreviewProvider {
    static var previews: some View {
        FuncButtons(myModel: MyModel())
    }
}
