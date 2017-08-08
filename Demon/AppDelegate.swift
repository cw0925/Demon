//
//  AppDelegate.swift
//  Demon
//
//  Created by afarsoft on 2017/8/8.
//  Copyright © 2017年 afarsoft. All rights reserved.
//

import UIKit

//微信
let WXAppID = "wxcdf48bdbdd0c4c6f"
let WXAppSecret = "299ca35405233f0775c58c0634faec16"
//QQ
let QQAppID = "1104744025"
let QQAppKey = "GdiLLicEWLWQWEaI"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        if UserDefaults.standard.bool(forKey: "logined") {
            window?.rootViewController = BaseTabBarController()
        }else{
            window?.rootViewController = UIStoryboard.init(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "login")
        }
        //ShareSDK
        ShareSDK.registerActivePlatforms([
            SSDKPlatformType.typeSinaWeibo.rawValue,
            SSDKPlatformType.typeWechat.rawValue,
            SSDKPlatformType.typeQQ.rawValue
            ], onImport: { (platform : SSDKPlatformType) in
                switch platform
                {
                case SSDKPlatformType.typeWechat:
                    ShareSDKConnector.connectWeChat(WXApi.classForCoder())
                case SSDKPlatformType.typeQQ:
                    ShareSDKConnector.connectQQ(QQApiInterface.classForCoder(), tencentOAuthClass: TencentOAuth.classForCoder())
                default:
                    break
                }
        }) { (platform : SSDKPlatformType, appInfo : NSMutableDictionary?) in
            switch platform
            {
            case SSDKPlatformType.typeWechat:
                //设置微信应用信息
                appInfo?.ssdkSetupWeChat(byAppId: WXAppID,
                                         appSecret: WXAppSecret)
            case SSDKPlatformType.typeQQ:
                //设置QQ应用信息
                appInfo?.ssdkSetupQQ(byAppId: QQAppID,
                                     appKey: QQAppKey,
                                     authType: SSDKAuthTypeWeb)
            default:
                break
            }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

