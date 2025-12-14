//
//  ViewController.swift
//  Lopatecki_lab2
//
//  Created by Dominik Lopatecki on 23/11/2023.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var firstField: NSTextField!
    @IBOutlet weak var secondField: NSTextFieldCell!
    @IBOutlet weak var thirdField: NSTextField!
    @IBOutlet weak var fourthField: NSTextField!
    @IBOutlet weak var fifthField: NSTextField!
    @IBOutlet weak var segmentControl: NSSegmentedControl!
    
    static let model: MyModel = MyModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            forName: NSNotification.Name(rawValue: "resultChangedNotification"),
            object: nil,
            queue: nil
        ){ (theNotification: Notification) -> Void in
            self.firstField.stringValue = ViewController.model.fields[0]
            self.secondField.stringValue = ViewController.model.fields[1]
            self.thirdField.stringValue = ViewController.model.fields[2]
            self.fourthField.stringValue = ViewController.model.fields[3]
            self.fifthField.stringValue = ViewController.model.fields[4]
            
            self.firstField.backgroundColor = ViewController.model.colors[0]
            self.secondField.backgroundColor = ViewController.model.colors[1]
            self.thirdField.backgroundColor = ViewController.model.colors[2]
            self.fourthField.backgroundColor = ViewController.model.colors[3]
            self.fifthField.backgroundColor = ViewController.model.colors[4]
        }

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func pressNumericButton(_ sender: NSButton) {
        ViewController.model.numericPress(sender.title)
    }
    
    @IBAction func pressCheckButton(_ sender: NSButton) {
        ViewController.model.check()
    }
    
    @IBAction func pushClearButton(_ sender: NSButton) {
        ViewController.model.clearPress()
    }
    
    @IBAction func pressNewGameButton(_ sender: NSButton) {
        ViewController.model.newGame()
        segmentControl.selectSegment(withTag: 0)
    }
    
    @IBAction func segmentChange(_ sender: NSSegmentedControl) {
        ViewController.model.setIndex(sender.selectedSegment)
    }
}

