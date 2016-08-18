//
//  OrderData.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/18.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

// 出品テーブル
class OrderData: NSObject {
    var id: String?
    var image: UIImage? // 画像複数なら images: [image] = [] か？
    var imageString: String?
    var name: String? // タイトル名
    var body: String? // 本文
    var modified: NSDate?
    var created: NSDate?
    
    init(snapshot: FIRDataSnapshot, myId: String) {
        // key
        id = snapshot.key
        
        // value
        let data = snapshot.value as! [String: AnyObject] // key:KeyType, value:ValuType の型
        
        imageString = data["image"] as? String // as? は nilがありうる
        image = UIImage(data: NSData(base64EncodedString: imageString!, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)!)
        
        name = data["name"] as? String
        body = data["body"] as? String
        
        modified = NSDate(timeIntervalSinceReferenceDate: data["modified"] as! NSTimeInterval)
        created = NSDate(timeIntervalSinceReferenceDate: data["created"] as! NSTimeInterval)
    }
    
}
