//
//  AppController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/16.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import Foundation
import UIKit

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
    
}