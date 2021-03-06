//
//  AppDelegate.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/16.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import Firebase
import SlideMenuControllerSwift
import FontAwesome_swift
import WebPay

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // firebase
        FIRApp.configure()
        // Adobe
        AdobeUXAuthManager.sharedManager().setAuthenticationParametersWithClientID(CommonConst.ADOBE_CLIENT_ID, withClientSecret: CommonConst.ADOBE_CLIENT_SECRET)
        // webpay
        WPYTokenizer.setPublicKey(WebpayClient.publicKey)
       
        SlideMenuOptions.leftViewWidth = 320
        SlideMenuOptions.contentViewScale = 1.0
        SlideMenuOptions.panFromBezel = false // 左からのスライドを停止。スクロールメニューのスライドだけ有効にするため
        
        // 移動
        let view = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("OrderIndex") as UIViewController
        self.window?.rootViewController = view
        self.window?.makeKeyWindow()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

