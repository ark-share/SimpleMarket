//
//  CommentAddViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/09/05.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit

// コメント
class CommentAddViewController: UIViewController {

    @IBOutlet weak var commentTextField: UITextField! // コメント欄
    @IBOutlet weak var announceLabel: UILabel! // アナウンスメッセージの変更
    @IBOutlet weak var submitButton: UIButton!
    
    var orderData: OrderData!

    override func viewDidLoad() {
        super.viewDidLoad()

        // はじめは全て非表示
        commentTextField.hidden = true
        announceLabel.hidden = true
        submitButton.enabled = false
        
        // ログインチェック
        if !AppController().isLogin() {
            AppController().openLoginView(self)
        }
        
        // 上の方に商品詳細のサムネイル　を予定してたけどスクロール内に表示するため一旦保留
//        if orderData != nil {
//            if orderData.image != nil {
//                imageView.image = orderData.image!
//            }
//            if orderData.price != nil {
//                priceLabel.text = orderData.price
//            }
//            if orderData.name != nil {
//                nameLabel.text = orderData.name
//            }
//        }
        
        // ボタンに右アイコン追加
//        let image = UIImage.fontAwesomeIconWithName(.ChevronRight, textColor: UIColor.blackColor(), size: CGSizeMake(25, 25))
//        toOrderDetailButton.setImage(image, forState: .Normal)
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
//        // コメントページに限り、「戻る」の時にログインチェックしないようにするため viewDidLoadだけでログインチェックする
//        if !AppController().isLogin() {
//            AppController().openLoginView(self)
//        }
        
        // はじめは非表示
        commentTextField.hidden = true
        announceLabel.hidden = true
        submitButton.enabled = false
        
        // ログイン有：入力フォームを有効にする
        if AppController().isLogin() {
            commentTextField.hidden = false
            submitButton.enabled = true
        }
        else {
            announceLabel.text = "ログインしていません"
            announceLabel.hidden = false
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
