//
//  ContentView.swift
//  Lopatecki_lab4
//
//  Created by Dominik Lopatecki on 21/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var offY: Double = 0
    @State private var offY2: Double = 0
    @State private var offY3: Double = 0
    @State private var offY4: Double = 0
    @State private var show: Bool = true
    @State private var show2: Bool = true
    @State private var show3: Bool = true
    @State private var show4: Bool = true
    
    
    
    var body: some View {
        
        ZStack(){
            Rectangle()
                .foregroundColor(Color.white)
                .frame(width: 600, height: 600)

            Circle()
                .foregroundColor(Color.black)
                .frame(width: 80, height: 80)

            if show {
                Circle()
                    .foregroundColor(Color.blue)
                    .frame(width: 50, height: 50)
                    .position(x: 300, y: -25)
                    .mojAnimatorOffset(animValue: self.offY, finalValue: 325)
                        {
                            self.show.toggle()
                        }
                    .transition(
                        .asymmetric(
                            insertion: AnyTransition.opacity.animation(.linear(duration: 0.5)),
                            removal: AnyTransition.scale.animation(.linear(duration: 1)))).zIndex(1)

                    .onAppear()
                    {
                        withAnimation(.linear(duration: 2))
                        {
                            self.offY = 325
                        }
                    }
                    .onDisappear()
                    {
                        self.offY = 0
                        self.show.toggle()
                    }
            }
            
            if show2 {
                Circle()
                    .foregroundColor(Color.red)
                    .frame(width: 50, height: 50)
                    .position(x: 300, y: 625)
                    .mojAnimatorOffset(animValue: self.offY2, finalValue: -325)
                        {
                            self.show2.toggle()
                        }
                    .transition(
                        .asymmetric(
                            insertion: AnyTransition.opacity.animation(.linear(duration: 0.5)),
                            removal: AnyTransition.scale.animation(.linear(duration: 1)))).zIndex(1)

                    .onAppear()
                    {
                        withAnimation(.linear(duration: 2.5))
                        {
                            self.offY2 = -325
                        }
                    }
                    .onDisappear()
                    {
                        self.offY2 = 0
                        self.show2.toggle()
                    }
            }
            
            if show3 {
                Circle()
                    .foregroundColor(Color.green)
                    .frame(width: 50, height: 50)
                    .position(x: 625, y: 300)
                    .mojAnimatorOffset2(animValue: self.offY3, finalValue: -325)
                        {
                            self.show3.toggle()
                        }
                    .transition(
                        .asymmetric(
                            insertion: AnyTransition.opacity.animation(.linear(duration: 0.5)),
                            removal: AnyTransition.scale.animation(.linear(duration: 1)))).zIndex(1)

                    .onAppear()
                    {
                        withAnimation(.linear(duration: 4))
                        {
                            self.offY3 = -325
                        }
                    }
                    .onDisappear()
                    {
                        self.offY3 = 0
                        self.show3.toggle()
                    }
            }
            
            if show4 {
                Circle()
                    .foregroundColor(Color.purple)
                    .frame(width: 50, height: 50)
                    .position(x: -25, y: 300)
                    .mojAnimatorOffset2(animValue: self.offY4, finalValue: 325)
                        {
                            self.show4.toggle()
                        }
                    .transition(
                        .asymmetric(
                            insertion: AnyTransition.opacity.animation(.linear(duration: 0.5)),
                            removal: AnyTransition.scale.animation(.linear(duration: 1)))).zIndex(1)

                    .onAppear()
                    {
                        withAnimation(.linear(duration: 3))
                        {
                            self.offY4 = 325
                        }
                    }
                    .onDisappear()
                    {
                        self.offY4 = 0
                        self.show4.toggle()
                    }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct OffsetAnimModifier: AnimatableModifier{
    var animValue: Double
    var finalValue: Double
    var onFinish: () -> () = {}
    
    private var currOffset: Double {animValue}
    
    var animatableData: Double {
        get {animValue}
        set{
            animValue = newValue
            checkIfFinished()
        }
    }
    
    func checkIfFinished() -> () {
        if fabs(animValue - finalValue) < Double.ulpOfOne {
            DispatchQueue.main.async {
                self.onFinish()
            }
        }
    }
    
    func body(content: Content) -> some View {
        content
            .offset(x:0, y: currOffset)
    }
}
extension View{
    func mojAnimatorOffset(animValue: Double, finalValue: Double, onFinish: @escaping () -> ()) -> some View{
        modifier(
        OffsetAnimModifier(animValue: animValue, finalValue: finalValue, onFinish: onFinish)
        )
    }
}

struct OffsetAnimModifier2: AnimatableModifier{
    var animValue: Double
    var finalValue: Double
    var onFinish: () -> () = {}
    
    private var currOffset: Double {animValue}
    
    var animatableData: Double {
        get {animValue}
        set{
            animValue = newValue
            checkIfFinished()
        }
    }
    
    func checkIfFinished() -> () {
        if fabs(animValue - finalValue) < Double.ulpOfOne {
            DispatchQueue.main.async {
                self.onFinish()
            }
        }
    }
    
    func body(content: Content) -> some View {
        content
            .offset(x:currOffset, y: 0)
    }
}
extension View{
    func mojAnimatorOffset2(animValue: Double, finalValue: Double, onFinish: @escaping () -> ()) -> some View{
        modifier(
        OffsetAnimModifier2(animValue: animValue, finalValue: finalValue, onFinish: onFinish)
        )
    }
}

