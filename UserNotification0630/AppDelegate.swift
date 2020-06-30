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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //TODO: 1- get reference
        let notificationCenter = UNUserNotificationCenter.current()
        
        //TODO: 2- request authorization
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if granted && error == nil {
                print("Permission Granted")
            }
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

