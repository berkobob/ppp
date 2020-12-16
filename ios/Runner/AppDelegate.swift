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
    let reminders = Reminders()
    
    channel.setMethodCallHandler {
        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        switch call.method {
        
        case "hasAccess":
            result(reminders.hasAccess);
            
        case "defaultList":
            result(reminders.defaultList?.title)
//            result([
//                "title": reminders.defaultList?.title,
//                "id": reminders.defaultList?.calendarIdentifier
//            ])
            
        default: result(FlutterMethodNotImplemented)
        }
    }
    
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
