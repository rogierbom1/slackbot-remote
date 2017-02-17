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

    @IBAction func sendMessage(_ sender: AnyObject) {
        
        let defaults = UserDefaults.standard
        let url = URL(string: defaults.object(forKey: "slackbotUrl") as! String)
        
        var components = URLComponents(url: url!, resolvingAgainstBaseURL: true)
        
        // Set querystring parts.
        components?.queryItems = [
            URLQueryItem(name: "token", value: defaults.object(forKey: "token") as? String),
            URLQueryItem(name: "channel", value: channelTextField.stringValue)
        ]
        
        let session = URLSession.shared
        let message = messageTextField.stringValue
        
        let request = NSMutableURLRequest(url: (components?.url)!)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        request.httpBody = message.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            
            guard let _:Data = data, let _:URLResponse = response, error == nil else {
                print("error")
                return
            }
            
            let dataString = NSString(data: data!, encoding: String.Encoding.utf8)
            print(dataString)
            
            // Clear textfield after sending.
            self.messageTextField.stringValue = ""
            
        }) 
        
        task.resume()
    }

}

