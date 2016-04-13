//
//  ViewController.swift
//  Slackbot Remote
//
//  Created by Rogier Bom on 22/12/15.
//  Copyright © 2015 Rogier Bom. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    
    @IBOutlet weak var channelTextField: NSTextField!
    @IBOutlet weak var messageTextField: NSTextField!

    @IBAction func sendMessage(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let url = NSURL(string: defaults.objectForKey("slackbotUrl") as! String)
        
        let components = NSURLComponents(URL: url!, resolvingAgainstBaseURL: true)
        
        // Set querystring parts.
        components?.queryItems = [
            NSURLQueryItem(name: "token", value: defaults.objectForKey("token") as? String),
            NSURLQueryItem(name: "channel", value: channelTextField.stringValue)
        ]
        
        let session = NSURLSession.sharedSession()
        let message = messageTextField.stringValue
        
        let request = NSMutableURLRequest(URL: (components?.URL)!)
        request.HTTPMethod = "POST"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        request.HTTPBody = message.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = session.dataTaskWithRequest(request) {
            (let data, let response, let error) in
            
            guard let _:NSData = data, let _:NSURLResponse = response where error == nil else {
                print("error")
                return
            }
            
            let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(dataString)
            
            // Clear textfield after sending.
            self.messageTextField.stringValue = ""
            
        }
        
        task.resume()
    }

}

