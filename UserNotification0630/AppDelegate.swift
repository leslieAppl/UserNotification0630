//
//  AppDelegate.swift
//  UserNotification0630
//
//  Created by leslie on 6/30/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit
//TODO: 0- import User Notification Framework
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    ///Important:
    ///Before iOS 12: The start point to configure Widows
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //TODO: 1- get reference
//        let notificationCenter = UNUserNotificationCenter.current()
        
        //TODO: 2- request authorization
        ///User Notification
//        notificationCenter.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
//            if granted && error == nil {
//                print("Permission Granted")
//            }
//        }
        
        //TODO: (Optional) Provisional Notification: Deliver Quietly
        ///Step 1
//        notificationCenter.requestAuthorization(options: [.alert, .sound, .provisional]) { (granted, error) in
//            if granted && error == nil {
//                print("Permission Granted")
//            }
//        }
        
        //TODO: (Optional) Showing notifications when the app is being used
        ///2- Init the window object and set up its own root view controller
//        let vc = ViewController()
//        let frame = UIScreen.main.bounds
//        window = UIWindow(frame: frame)
//        window!.rootViewController = vc
//        window!.makeKeyAndVisible()
//
//        ///3- Assigning the ViewController class as the delegate
//        notificationCenter.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
//            if granted && error == nil {
//                let main = OperationQueue.main
//                main.addOperation {
//                    notificationCenter.delegate = self.window?.rootViewController as! ViewController
//                }
//            }
//        }
        
        return true
    }
    
    

    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

