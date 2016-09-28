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
    
    // ステータス別に案内メッセージを返す
    // [0:"出品中", 1:"入金待ち", 2:"決済済み/未発送", 3:"配達待ち/発送済み", 4:"受取評価待ち/配達済み", 5:"完了評価待ち", 6:"取引完了"]
    func getInfoMessageforBuy(status: String) -> String {
        var info: String = "buy"
        
        if status == "0" {
            info = ""
        }
        if status == "1" {
            info = "入金確認をお待ち下さい。購入から２４時間経過しても確認されない場合は、運営までお問い合わせください。"
        }
        if status == "2" {
            info = "商品の発送をお待ち下さい。購入から４８時間経過しても発送通知がない場合は、出品者までお問い合わせください。"
        }
        if status == "3" {
            info = "運送業者の配達をお待ち下さい。"
        }
        if status == "4" {
            info = "受け取り評価してください。"
        }
        if status == "5" {
            info = "売り手による完了評価をお待ち下さい。"
        }
        if status == "6" {
            info = ""
        }
        
        return info
    }
    func getInfoMessageforSell(status: String) -> String {
        var info: String = "sell"
        
        if status == "0" {
            info = ""
        }
        if status == "1" {
            info = "購入者の入金をお待ち下さい"
        }
        if status == "2" {
            info = "商品を発送してください。発送したのち、次の発送通知を実施してください。"
        }
        if status == "3" {
            info = "運送業者の配達をお待ち下さい。"
        }
        if status == "4" {
            info = "購入者の受け取り評価をお待ち下さい。配達から２４時間経過しても評価がない場合は、購入者までお問い合わせください。"
        }
        if status == "5" {
            info = "完了評価してください。利益が確定します。"
        }
        if status == "6" {
            info = ""
        }
        return info
    }
}
