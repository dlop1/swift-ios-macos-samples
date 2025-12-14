//
//  MyModel.swift
//  Lopatecki_lab2
//
//  Created by Dominik Lopatecki on 23/11/2023.
//

import Cocoa

class MyModel{
    
    var generatedNumber: [String] = ["9", "6", "5", "4", "1"]
    var index: Int = 0
    var fields: [String] = ["", "", "", "", ""]{
        didSet{
            let notificationCenter = NotificationCenter.default
            let notification = Notification(
                name: NSNotification.Name(rawValue: "resultChangedNotification"),
                object: nil
            )
            notificationCenter.post(notification)
        }
    }
    var colors: [NSColor] = [NSColor.white, NSColor.white, NSColor.white, NSColor.white, NSColor.white]{
        didSet{
            let notificationCenter = NotificationCenter.default
            let notification = Notification(
                name: NSNotification.Name(rawValue: "resultChangedNotification"),
                object: nil
            )
            notificationCenter.post(notification)
        }
    }
    
    func numericPress(_ number: String){
        fields[index] = number;
    }
    
    func clearPress(){
        fields[index] = ""
    }
    
    func setIndex(_ newIndex: Int){
        index = newIndex
    }
    
    func newGame(){
        index = 0
        fields = ["", "", "", "", ""]
        colors = [NSColor.white, NSColor.white, NSColor.white, NSColor.white, NSColor.white]
    }
    
    func check(){
        for (i, field) in fields.enumerated(){
            if !fields.contains(""){
                if field == generatedNumber[i]
                {
                    colors[i] = NSColor.green
                }
                else if generatedNumber.contains(field){
                    colors[i] = NSColor.orange
                }
                else {
                    colors[i] = NSColor.gray
                }
            }
        }
    }
}


