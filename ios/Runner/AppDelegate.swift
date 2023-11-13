import UIKit
import Flutter
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
//    override func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
//        if userActivity.activityType == NSUserActivityTypeBrowsingWeb {
//            let webpageURL = userActivity.webpageURL
//            if webpageURL != nil && TencentOAuth.canHandleUniversalLink(webpageURL!) {
//                // QQ
//                return (QQApiInterface.handleOpenUniversallink(webpageURL, delegate: self) || TencentOAuth.handleUniversalLink(webpageURL))
//            } else
//
            
//            if webpageURL?.absoluteString.hasPrefix("http://pdv3m9.natappfree.cc/wx677ea03de2866612") == true {
//                // 微信
//                if WXApi.handleOpenUniversalLink(userActivity, delegate: self) {
//                    // Handle successfully
//                } else {
//                    WXApi.handleOpen(webpageURL, delegate: self)
//                }
//                return true
//            }
//            // Write your own logic here
//        }
//        return true
//    }
}
