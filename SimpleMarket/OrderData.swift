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
    // Order
    var id: String? // id自体はfirebaseに保存しておらず、snapshot.keyを代入しているだけ
    var image: UIImage? // 画像複数なら images: [image] = [] か？
    var imageString: String?
    var name: String? // タイトル名
    var body: String? // 本文
    var price: String? // 価格 Intの方がいい？
    var status: String? // ステータス
    var statusName: String? // ステータス名
    var user_id: String?
    var user_name: String? // ユーザー名（表示用）
    var buy_user_id: String?
    var buy_user_name: String? // ユーザー名（表示用）
    var modified: NSDate?
    var created: NSDate?
    
    // Comment
    //var comments: [CommentData] = [] // コメント数とか取る場合に必要か
    var order_comment_count: Int? = 0
    var trade_comment_count: Int? = 0
    
    init(snapshot: FIRDataSnapshot) { //, myId: String
        // key
        id = snapshot.key
        
        // value
        let data = snapshot.value as! [String: AnyObject] // key:KeyType, value:ValuType の型
        
        imageString = data["image"] as? String // as? は nilがありうる
        if imageString != nil {
            image = UIImage(data: NSData(base64EncodedString: imageString!, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)!)
        }
        name = data["name"] as? String
        body = data["body"] as? String
        price = data["price"] as? String
        status = data["status"] as? String
        
        if status != nil {
            statusName = CommonConst.OrderStatusArray[Int(status!)!]
        }
        
        // Comment ここだと商品一覧の各タグそれぞれ全部のコメントを取り出してる
        if let comments = data["order_comments"] {
            order_comment_count = comments.count
        }
        if let comments = data["trade_comments"] {
            trade_comment_count = comments.count
        }
        
        user_id = data["user_id"] as? String
        user_name = data["user_name"] as? String
        buy_user_id = data["buy_user_id"] as? String
        buy_user_name = data["buy_user_name"] as? String

        modified = NSDate(timeIntervalSinceReferenceDate: data["modified"] as! NSTimeInterval)
        created = NSDate(timeIntervalSinceReferenceDate: data["created"] as! NSTimeInterval)
    }
    
    let ref = FIRDatabase.database().reference().child(CommonConst.OrderPATH)

    
    // 単一カラムを更新する
    // self.orderData.saveFieldのように呼ぶ
    func saveField(field: String, value: String) {
        let modified = NSDate.timeIntervalSinceReferenceDate()
        
        // idはあらかじめセットされたものを使う
        // status:0は出品中
        let data = [field: value, "modified": modified]
        ref.child(self.id!).updateChildValues(data as [NSObject : AnyObject])
    }
    // 複数保存 型が異なって保存ができない
    func save(datas: [NSObject : AnyObject]) {
        let modified = NSDate.timeIntervalSinceReferenceDate()
        
        // idはあらかじめセットされたものを使う
        var values = datas as? Dictionary
        values!["modified"] = modified
        
        ref.child(self.id!).updateChildValues(values! as [NSObject : AnyObject])
    }

    // tradeコメントの投稿 >> これCommentDataクラスに起きたいけど、CommentDat().みたいに呼ぼうとするとinit()が走ってしまう　どうするか
    // システムが投稿するコメントなのでorder_commentの処理は作ってない
    func saveTradeComment(order_id: String, body: String) {
        // 保存先
        let commentRef = FIRDatabase.database().reference().child(CommonConst.OrderPATH+"/"+order_id+"/"+CommonConst.TradeCommentPATH)
        
        //let user = AppController().displayName // displayNameの事
        let modified = NSDate.timeIntervalSinceReferenceDate()
        let created = NSDate.timeIntervalSinceReferenceDate()
        
        let user_id = FIRAuth.auth()?.currentUser?.uid
        let user_name = FIRAuth.auth()?.currentUser?.displayName
        
        let data = [
            "body": body,
            "user_id": user_id!, "user_name": user_name!,
            "modified": modified, "created": created]
        
        commentRef.childByAutoId().setValue(data)
    }
    
}
