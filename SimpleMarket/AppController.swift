//
//  AppController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/16.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class AppController: NSObject {

    // 表示名を保存
    func setDisplayName(name: String) {
        let ud = NSUserDefaults.standardUserDefaults()
        ud.setValue(name, forKey: CommonConst.DisplayNameKey)
        ud.synchronize()
    }
    func getDisplayName() -> String {
        let ud = NSUserDefaults.standardUserDefaults()
        
        let name = ud.objectForKey(CommonConst.DisplayNameKey) as? String
        if name != nil {
            return name!
        }
        return ""
    }
    
    // ログインチェック
    func isLogin() -> Bool {
        if FIRAuth.auth()?.currentUser != nil {
            return true
        }
        return false
    }
    // ログインウィンドウを開く
    func openLoginView(vc: UIViewController) {
        dispatch_async(dispatch_get_main_queue()) {
            let view = UIStoryboard(name: "User", bundle: nil).instantiateViewControllerWithIdentifier("UserLogin") as UIViewController
            vc.presentViewController(view, animated: true, completion: nil)
        }
    }
    
}