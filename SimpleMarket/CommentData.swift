//
//  CommentData.swift
//  SimpleMarket
//
//  Created by macpc on 2016/09/07.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

// コメントテーブル
class CommentData: NSObject {
    // Comment
    var id: String?
    var body: String? // 本文
    var user_id: String?
    var user_name: String? // ユーザー名（表示用）
    var modified: NSDate?
    var created: NSDate?
    
    init(snapshot: FIRDataSnapshot) { //, orderID: String 必要ない？
        // key
        id = snapshot.key
        
        // value
        let data = snapshot.value as! [String: AnyObject] // key:KeyType, value:ValuType の型
        
        body = data["body"] as? String
        user_id = data["user_id"] as? String
        user_name = data["user_name"] as? String
        
        modified = NSDate(timeIntervalSinceReferenceDate: data["modified"] as! NSTimeInterval)
        created = NSDate(timeIntervalSinceReferenceDate: data["created"] as! NSTimeInterval)
    }
 
    
}
