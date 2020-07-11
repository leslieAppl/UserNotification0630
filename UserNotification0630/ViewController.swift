//
//  ViewController.swift
//  UserNotification0630
//
//  Created by leslie on 6/30/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit
//TODO: 0- import User Notification Framework
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var messageField: UITextField!
    
    var notificationCenter: UNUserNotificationCenter!
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //TODO: 1- get reference
        notificationCenter = UNUserNotificationCenter.current()
    }

    @IBAction func saveNotification(_ sender: UIButton) {

        //TODO: 2- get notification authorization status from the user
        ///User Notification
        notificationCenter.getNotificationSettings { (settings) in
            if settings.authorizationStatus == .authorized{
                let main = OperationQueue.main
                main.addOperation {
//                    self.sendNotification()
                    self.sendNotification2()
                }
            }
        }
        
        //TODO: (Optional) Provisional Notification: Deliver Quietly
        ///Step 2
//        notificationCenter.getNotificationSettings { (settings) in
//            let status = settings.authorizationStatus
//            if status == .authorized || status == .provisional {
//                let main = OperationQueue.main
//                main.addOperation {
//                    self.sendNotification()
//                }
//            }
//        }

    }
    
    func sendNotification() {
        ///Custom Notification Groups -1
        var groupID = "Group One"
        if count >= 2 {
            groupID = "Group Tow"
        }
        count += 1
        
        //TODO: 3- init notification content
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = self.messageField.text!
//        content.sound = UNNotificationSound.default
        content.sound = UNNotificationSound(named: UNNotificationSoundName("alarm.mp3"))
        ///Custom Notification Groups -2
        content.threadIdentifier = groupID
        
        //TODO: 4- init notification trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //TODO: 5- set notification id
        let id = "reminder-\(UUID())"
        
        //TODO: 6- init notification request
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        //TODO: 7- add new notification in the Notification Center
        notificationCenter.add(request) { (error) in
            
            //The closure that is executed when the process is over.
            let main = OperationQueue.main
            main.addOperation {
                self.messageField.text = ""
            }
            
        }
        
    }
    
}
//TODO: (Optional) Showing notifications when the app is being used
extension ViewController: UNUserNotificationCenterDelegate {
    
    //MARK: - UNUserNotificationCenterDelegate method
    ///1- adopted UNUserNotificationCenterDelegate protocol and implemented userNotificationCenter() method
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        ///Calling the completionHandler() method, to show alert notifications.
        completionHandler([.alert])
        
    }
}

//TODO: (Optional) Actionable Notifications
///Adding and processing actions for notifications
extension ViewController {
    func sendNotification2() {
        ///processing an anction
        let actionDelete = UNNotificationAction(identifier: "deleteButton", title: "Delete", options: .destructive)
        ///processing an input action
        let actionInput = UNTextInputNotificationAction(identifier: "inputField", title: "Message", options: [])
        
        let category = UNNotificationCategory(identifier: "listActions", actions: [actionDelete, actionInput], intentIdentifiers: [], options: [])
        notificationCenter.setNotificationCategories([category])
        
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = messageField.text!
        content.categoryIdentifier = "listActions"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let id = "reminder-\(UUID())"
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        notificationCenter.add(request) { (error) in
            let main = OperationQueue.main
            main.addOperation {
                self.messageField.text = ""
            }
        }
    }
    
    //MARK: - UNUserNotificationCenterDelegate method
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let identifier = response.actionIdentifier
        if identifier == "deleteButton" {
            print("Delete Message")
        }
        else if identifier == "inputField" {
            print("Send: \((response as! UNTextInputNotificationResponse).userText)")
        }
        
        completionHandler() //Don't miss that
    }
}
