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
        let channel = defaults.objectForKey("channel") as! String
        
        let url = NSURL(string: defaults.objectForKey("slackbotUrl") as! String)
        var request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        var session = NSURLSession.sharedSession()
        
        var err: NSError?
        
        task = session.dataTaskWithRequest(request) {
            
        }
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

