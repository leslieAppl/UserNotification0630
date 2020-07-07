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
//        notificationCenter.getNotificationSettings { (settings) in
//            if settings.authorizationStatus == .authorized{
//                let main = OperationQueue.main
//                main.addOperation {
//                    self.sendNotification()
//                }
//            }
//        }
        
        ///Provisional Notification: Deliver Quietly - Step 2
        notificationCenter.getNotificationSettings { (settings) in
            let status = settings.authorizationStatus
            if status == .authorized || status == .provisional {
                let main = OperationQueue.main
                main.addOperation {
                    self.sendNotification()
                }
            }
        }

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

