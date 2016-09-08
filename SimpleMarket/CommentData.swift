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
    var user: String? // ユーザー（仮に名前だけ保持する）
    var modified: NSDate?
    var created: NSDate?
    
    init(snapshot: FIRDataSnapshot) { //, orderID: String 必要ない？
        // key
        id = snapshot.key
        
        // value
        let data = snapshot.value as! [String: AnyObject] // key:KeyType, value:ValuType の型
        
        body = data["body"] as? String
        
        modified = NSDate(timeIntervalSinceReferenceDate: data["modified"] as! NSTimeInterval)
        created = NSDate(timeIntervalSinceReferenceDate: data["created"] as! NSTimeInterval)
    }
    
}
