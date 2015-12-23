# MJInactiveUserNotifications
SWIFT Extension on UIApplication to instantly add UILocalNotifications to a user who has been inactive for a specific time

[![Example](https://raw.githubusercontent.com/mayuur/MJInactiveUserNotifications/master/Screenshot.PNG)](https://raw.githubusercontent.com/mayuur/MJInactiveUserNotifications/master/Screenshot.PNG)

#### Setup: 

1. Setup permissions for Local Notifications in `AppDelegate.m` in the following function

```
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: [.Sound, .Alert, .Badge], categories: nil));
        return true
    }
```

2. Whenever app goes into Background, add the local notifications with proper time interval and the desired text. Eg: 

```
    func applicationDidEnterBackground(application: UIApplication) {
        UIApplication.sharedApplication().scheduleMJLocalNotification("Max, we miss you! Check out our new updates!", duration: 15, soundName: "notification1.mp3", notificationType: MJNotificationType.MJNotificationTypeInactive);
    }
```

3. In case User opens up the app before the inactivity period expires, just cancel all the local notifications regarding this inactivity. Eg: 
```
    func applicationWillEnterForeground(application: UIApplication) {
        application.cancelInactiveMJLocalNotifications();
    }
```

#### Schedule a normal Local Notification: 

Suppose if you just want to add a local notification anywhere inside the app (not regarding the inactivity), then just write the following code: 

```
   UIApplication.sharedApplication().scheduleMJLocalNotification("Max, we miss you! Check out our new updates!", duration: 15, soundName: "notification1.mp3", notificationType: MJNotificationType.MJNotificationTypeSimple);
```


Follow me or ask questions or just say Hi! at Twitter : <a href="https://twitter.com/mayuur" target="_blank">@mayuur</a>

