//
//  ViewController.swift
//  SwiftNotifications
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    
    @IBAction func register(sender: UIButton) {
        
        var customParams : Dictionary<String, String> = ["City" : "Palo Alto"];
        
        Everlive.sharedInstance().registerDeviceWithParameters(customParams , block: { (success: Bool, error : NSError!) -> Void in
            
            if((error) != nil){
                self.infoLabel.text = error.localizedDescription
            } else {
                self.infoLabel.text = "Your device is now registered and ready to receive push notifications."
            }
        })
    }
    
    @IBAction func unregister(sender: UIButton) {
        Everlive.sharedInstance().removeDevice { (success:Bool, error:NSError!) -> Void in
            if((error) != nil){
                self.infoLabel.text = error.localizedDescription
            } else {
                self.infoLabel.text = "You have unregistered your device"
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

