//
//  CommentAddViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/09/05.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

private let commentReuseIdentifier = "CommentCell"
private let orderDetailReuseIdentifier = "OrderDetailCell"


// コメントページ
class CommentAddViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // コメントテーブル
    @IBOutlet weak var tableView: UITableView!
    // コメント投稿フォーム
    @IBOutlet weak var commentTextField: UITextField! // コメント欄
    @IBOutlet weak var announceLabel: UILabel! // アナウンスメッセージの変更
    @IBOutlet weak var submitButton: UIButton!
    
    var orderData: OrderData! // 前の画面からdataを受け取る
    
    var commentArray: [CommentData] = [] // 一覧用データ
    
    // 送信ボタン
    @IBAction func handleSubmitButton(sender: AnyObject) {
        if orderData.id != nil {
            // コメントの保存先
            let commentRef = FIRDatabase.database().reference().child(CommonConst.OrderPATH+"/"+orderData.id!+"/"+CommonConst.CommentPATH)

            let body = commentTextField.text // String?型なのでアンラップする
            let user = AppController().displayName // displayNameの事
            let modified = NSDate.timeIntervalSinceReferenceDate()
            let created = NSDate.timeIntervalSinceReferenceDate()
            
            let data = ["body": body!, "user": user, "modified": modified, "created": created]
            commentRef.childByAutoId().setValue(data)
        }
    }

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
        
        // nibの登録
        tableView.registerNib(UINib(nibName: "OrderDetailTableViewCell", bundle: nil), forCellReuseIdentifier: orderDetailReuseIdentifier)
        tableView.registerNib(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: commentReuseIdentifier)
        
        // ordersに要素が追加されたらクロージャ呼び出す
        FIRDatabase.database().reference().child(CommonConst.OrderPATH+"/"+orderData.id!+"/"+CommonConst.CommentPATH).observeEventType(.ChildAdded, withBlock: { snapshot in
            
            // データを設定する
            //if let uid = FIRAuth.auth()?.currentUser?.uid {
            let data = CommentData(snapshot: snapshot) //, myId: uid
            self.commentArray.insert(data, atIndex: 0)
            
            self.tableView.reloadData() // 再表示
            //}
        })
    }
    
    override func viewDidAppear(animated: Bool) {
        
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
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return commentArray.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 初めだけ異なるセル
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(orderDetailReuseIdentifier, forIndexPath: indexPath) as! OrderDetailTableViewCell
            cell.orderData = self.orderData
            
            return cell
        }
        // 他はコメントを表示
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier(commentReuseIdentifier, forIndexPath: indexPath) as! CommentTableViewCell
            cell.commentData = commentArray[indexPath.row]
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

        // 初めだけ異なるセル
        if indexPath.section == 0 {
            return 210
        }
        else {
            return 120
        }
    }


}
