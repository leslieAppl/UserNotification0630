//
//  SceneDelegate.swift
//  UserNotification0630
//
//  Created by leslie on 6/30/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    ///Important:
    ///After iOS 13: The start point to configure Scene
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        //TODO: 1- get reference
        let notificationCenter = UNUserNotificationCenter.current()
        
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
        ///2- Assigning the ViewController class as the delegate
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if granted && error == nil {
                let main = OperationQueue.main
                main.addOperation {
                    notificationCenter.delegate = self.window?.rootViewController as! ViewController
                }
            }
        }
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

