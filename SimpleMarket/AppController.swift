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

    //    // 表示名を保存
    //    func setDisplayName(name: String) {
    //        let ud = NSUserDefaults.standardUserDefaults()
    //        ud.setValue(name, forKey: CommonConst.DisplayNameKey)
    //        ud.synchronize()
    //    }
    //    func getDisplayName() -> String {
    //        let ud = NSUserDefaults.standardUserDefaults()
    //
    //        let name = ud.objectForKey(CommonConst.DisplayNameKey) as? String
    //        if name != nil {
    //            return name!
    //        }
    //        return ""
    //    }

    // 表示名のgetter/setterを書き直し
    var displayName: String {
        get {
            let ud = NSUserDefaults.standardUserDefaults()
            let val = ud.objectForKey(CommonConst.DisplayNameKey) as? String
            if val != nil {
                return val!
            }
            return ""
        }
        set {
            let ud = NSUserDefaults.standardUserDefaults()
            ud.setValue(newValue, forKey: CommonConst.DisplayNameKey)
            ud.synchronize()
        }
    }
    // 支払い方法
    var buyPayment: Int {
        get {
            let ud = NSUserDefaults.standardUserDefaults()
            let val = ud.objectForKey(CommonConst.BuyPaymentKey) as? Int
            if val != nil {
                return val! // ここでは数値を返す。辞書BuyPaymentArrayを通して「決済名」を返す
            }
            return -1 // 未設定の時は-1
        }
        set {
            let ud = NSUserDefaults.standardUserDefaults()
            ud.setValue(newValue, forKey: CommonConst.BuyPaymentKey)
            ud.synchronize()
        }
    }
    // 配送先のgetter/setter
    var buyAddress: String {
        get {
            let ud = NSUserDefaults.standardUserDefaults()
            let val = ud.objectForKey(CommonConst.BuyAddressKey) as? String
            if val != nil {
                return val!
            }
            return ""
        }
        set {
            let ud = NSUserDefaults.standardUserDefaults()
            ud.setValue(newValue, forKey: CommonConst.BuyAddressKey)
            ud.synchronize()
        }
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