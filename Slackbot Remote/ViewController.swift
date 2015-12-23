//
//  ViewController.swift
//  Slackbot Remote
//
//  Created by Rogier Bom on 22/12/15.
//  Copyright © 2015 Rogier Bom. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBAction func sendMessage(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let url = defaults.objectForKey("slackbotUrl")
        let channel = defaults.objectForKey("channel")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

