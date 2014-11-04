//
//  AppDelegate.swift
//  SwiftNotifications
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {

    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        Everlive.setDeviceToken(deviceToken)

        Everlive.sharedInstance().registerDevice { (success: Bool, error : NSError!) -> Void in
            // handle the success and error here
        }
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Everlive.setApplicationKey("2F8S7Yl58Sj1xADa")
        
        // create notification actions
        var firstAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction() 
        firstAction.identifier = "FIRST_ACTION"
        firstAction.title = "First Action"
        firstAction.activationMode = UIUserNotificationActivationMode.Foreground
        firstAction.destructive = true
        firstAction.authenticationRequired = false
        
        var secondAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction();
        secondAction.identifier = "SECOND_ACTION"
        secondAction.title = "Second Action"
        secondAction.activationMode = UIUserNotificationActivationMode.Foreground
        secondAction.destructive = false
        secondAction.authenticationRequired = false
        
        var thirdAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction();
        thirdAction.identifier = "THIRD_ACTION"
        thirdAction.title = "Third Action"
        thirdAction.activationMode = UIUserNotificationActivationMode.Background 
        thirdAction.destructive = false
        thirdAction.authenticationRequired = false
        
        // group the actions within categories
        // the actions will be displayed when a notification is received for this category
        var myCategory:UIMutableUserNotificationCategory = UIMutableUserNotificationCategory()
        myCategory.identifier = "FIRST_CATEGORY"
        
        var defaultActions:NSArray = [firstAction, secondAction, thirdAction] // will be shown in a alert style notification as options
        var minimalActions:NSArray = [thirdAction, firstAction] // will be shown in the lock screen and in the banner
        
        // set the minimum actions in regard to the different contexts in which the notification is displayed
        myCategory.setActions(defaultActions, forContext: UIUserNotificationActionContext.Default)
        myCategory.setActions(minimalActions, forContext: UIUserNotificationActionContext.Minimal)
        
        let categories:NSSet = NSSet(object: myCategory)
        
        // settings for user notifications
        let notificationTypes:UIUserNotificationType = UIUserNotificationType.Alert | UIUserNotificationType.Badge
        let notificationSettings:UIUserNotificationSettings = UIUserNotificationSettings(forTypes: notificationTypes, categories: categories)
        
		// register for remote notifications
        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings);
        UIApplication.sharedApplication().registerForRemoteNotifications()
		
        // Override point for customization after application launch.
        return true
    }

    // Notifications handler
   
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [NSObject : AnyObject], completionHandler: () -> Void) {
        
        if(identifier == "FIRST_ACTION") {
            NSNotificationCenter.defaultCenter().postNotificationName("firstActionTapped", object:nil )
        } else if(identifier == "SECOND_ACTION"){
            NSNotificationCenter.defaultCenter().postNotificationName("secondActionTapped", object: nil)
        } else if(identifier == "THIRD_ACTION"){
            NSNotificationCenter.defaultCenter().postNotificationName("thirdActionTapped", object: nil)
        }
        
        // calling the completion handler is mandatory
        completionHandler()
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    


}

