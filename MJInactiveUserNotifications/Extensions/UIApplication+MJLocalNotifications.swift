//
//  UIApplication+MJLocalNotifications.swift
//  MJInactiveUserNotifications
//
//  Created by Mayur Joshi on 12/22/15.
//  Copyright © 2015 Mayur Joshi. All rights reserved.
//

//  FOR MORE INFO, check out https://github.com/mayuur/MJInactiveUserNotifications

import UIKit

let MJNotificationKey = "MJNotificationID"
enum MJNotificationType : Int {
    /*
      MJNotificationTypeInactive - In situations where user hasn't opened the app since 10 days and you want to show a notification, use this type. These notifications will get cancelled once user opens the app
      MJNotificationTypeSimple - For every other situation, use this type.
    */
    case MJNotificationTypeInactive = 0, MJNotificationTypeSimple
}

extension UIApplication {
    
    /*
    Parameters :
    
      notifyText - the text which you want to show on the local notification
      duration - duration after which you want the local notification to come up
      soundName - (optional) name of the mp3/wav file which you want to play when notification comes up
                if no sound provided, a silent local notification will pop up
      notificationType - explains the type of notification
    
    Example Usage :
    
    Below example schedules a local notification with text "Wake up, Max!" after 15 seconds with the type - MJNotificationTypeInactive
    
    UIApplication.sharedApplication().scheduleMJLocalNotification("Wake up, Max!", duration: 15, soundName: "sample.mp3", notificationType: MJNotificationType.MJNotificationTypeInactive);
    */
    func scheduleMJLocalNotification (notifyText: String, duration: Int, soundName: String, notificationType: MJNotificationType) {
        
        //validate all input parameters
        let actualText : String = notifyText.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if actualText.characters.count == 0 {
            print("\(__FILE__) -- Local Notification text cannot be blank");
            return;
        }
        if(duration<=0) {
            print("\(__FILE__) -- Seconds for Local Notification cannot be zero or lesser");
            return;
        }
        
        if(soundName.characters.count == 0) {
            print("\(__FILE__) -- No sounds... Local Notification will be a silent one");
        }
        
        //setup a local notification if everything is okay
        let notification = UILocalNotification()
        notification.fireDate = NSDate().dateByAddingTimeInterval(NSTimeInterval(duration));
        notification.timeZone = NSTimeZone.localTimeZone()
        notification.alertBody = notifyText;
        notification.soundName = soundName;
        
        //add userinfo to detect Notifications for Inactive
        if(notificationType == MJNotificationType.MJNotificationTypeInactive) {
            let userInfo : [String: String] = [MJNotificationKey : "\(MJNotificationType.MJNotificationTypeInactive)"];
            notification.userInfo = userInfo;
        }
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification);
    }
    
    /*
      This function cancels all the notifications of the type - MJNotificationTypeInactive
    */
    func cancelInactiveMJLocalNotifications() {
        
        let localNotifications = UIApplication.sharedApplication().scheduledLocalNotifications;
        for notification in localNotifications! {
            
            if(notification.userInfo?[MJNotificationKey] != nil) {
                let notificationName = notification.userInfo?[MJNotificationKey];
                if(notificationName!.isEqual("\(MJNotificationType.MJNotificationTypeInactive)")) {
                    UIApplication.sharedApplication().cancelLocalNotification(notification);
                }
            }
            else {
                print("userinfo doesn't exist. This notification is of different type than MJNotificationTypeInactive");
            }
        }
    }
}
