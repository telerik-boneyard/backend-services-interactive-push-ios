//
//  ViewController.swift
//  SwiftNotifications
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        // We are posting the actions to the notification centre - add event observer
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"showAMessage", name: "firstActionTapped", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"showAMessage", name: "secondActionTapped", object: nil)
		NSNotificationCenter.defaultCenter().addObserver(self, selector:"showAMessage", name: "thirdActionTapped", object: nil)
    }

    func showAMessage(){
        var alertMessageController:UIAlertController = UIAlertController(title: "Push Sample App", message: "Hello push notifications", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertMessageController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alertMessageController, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

