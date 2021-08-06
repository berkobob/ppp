import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "family.lever.ppp/reminders", binaryMessenger: controller as! FlutterBinaryMessenger)
        let reminders = AppleReminders()
        
        channel.setMethodCallHandler {
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            switch call.method {
            
            case "hasAccess":
                result(reminders.hasAccess);
                
            case "defaultList":
                result(reminders.defaultList?.title)

            case "lists":
                DispatchQueue.main.async {
                    result(reminders.allLists())
                }

            case "getReminders":
                if let args = call.arguments as? [String: String] {
                    if let calendar = args["calendar"] {
                        reminders.getReminders(calendar) { (reminders) in
                            result(reminders)
                        }
                    }
                }

            case "deleteReminderWithId":
                if let args = call.arguments as? [String: String] {
                    if let id = args["reminder"] {
                        reminders.deleteReminder(id)
                        result(true)
                    }
                }
                
            default: result(FlutterMethodNotImplemented)
            }
        }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
