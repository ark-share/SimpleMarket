//
//  UserData.swift
//  SimpleMarket
//
//  Created by macpc on 2016/10/07.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

// ユーザーテーブル
class UserData: NSObject {
    // User
    var id: String? // id自体はfirebaseに保存しておらず、snapshot.keyを代入しているだけ
    var status: String? // ステータス
    
    init(snapshot: FIRDataSnapshot) { //, myId: String
        // key
        id = snapshot.key
        
        // value
        let data = snapshot.value as! [String: AnyObject] // key:KeyType, value:ValuType の型
        
        status = data["status"] as? String
    }
}
