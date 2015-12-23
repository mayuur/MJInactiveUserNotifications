# MJInactiveUserNotifications
SWIFT Extension on UIApplication to instantly add UILocalNotifications to a user who has been inactive for a specific time

[![Example](https://raw.githubusercontent.com/mayuur/MJInactiveUserNotifications/master/Screenshot.PNG)](https://raw.githubusercontent.com/mayuur/MJInactiveUserNotifications/master/Screenshot.PNG)

#### Setup

1. Setup permissions for Local Notifications in `AppDelegate.m` in the following function

```
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: [.Sound, .Alert, .Badge], categories: nil));

        return true
    }
```

Follow me or ask questions or just say Hi! at Twitter : <a href="https://twitter.com/mayuur" target="_blank">@mayuur</a>

