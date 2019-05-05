//
//  ConverterViewController.swift
//  CurrCon
//
//  Created by Nikhil Deo on 5/4/19.
//  Copyright © 2019 NikhilDeo. All rights reserved.
//

import Cocoa

class ConverterViewController: NSViewController {

    @IBOutlet weak var userInput: NSTextField!
    @IBOutlet weak var currencyChoice: NSPopUpButton!
    @IBOutlet weak var endValue: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}

extension ConverterViewController {
    // MARK: Storyboard instantiation
    static func freshController() -> ConverterViewController {
        //1.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        //2.
        let identifier = NSStoryboard.SceneIdentifier("ConverterViewController")
        //3.
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? ConverterViewController else {
            fatalError("Why cant i find QuotesViewController? - Check Main.storyboard")
        }
        return viewcontroller
    }
}

// MARK: Actions

extension ConverterViewController {
    @IBAction func convert(_ sender: NSButton) {
        let val = userInput.doubleValue
        var rate = 1.00
        let curr = currencyChoice.indexOfSelectedItem
        if (curr == 0) {
            rate = Double(0.89)
        } else if (curr == 1) {
            rate = Double(0.76)
        } else {
            rate = Double(18.92)
        }
        let returnVal = val*rate
        endValue.doubleValue = returnVal
    }
    
    @IBAction func quit(_ sender: NSButton) {
        NSApplication.shared.terminate(sender)
    }
}

