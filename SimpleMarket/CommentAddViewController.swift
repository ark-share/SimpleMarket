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
            let user = AppController().getDisplayName() // displayNameの事
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
        
        // order cell
        let orderDetailNib = UINib(nibName: "OrderDetailTableViewCell", bundle: nil) // Xibファイルの名前
        tableView.registerNib(orderDetailNib, forCellReuseIdentifier: orderDetailReuseIdentifier)

        // comment cell
        let commentNib = UINib(nibName: "CommentTableViewCell", bundle: nil) // Xibファイルの名前
        tableView.registerNib(commentNib, forCellReuseIdentifier: commentReuseIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension // 高さ自動
        
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
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return commentArray.count + 1 // 商品詳細の１件多くする
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        // 初めだけ異なるセル
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier(orderDetailReuseIdentifier, forIndexPath: indexPath) as! OrderDetailTableViewCell
            cell.orderData = self.orderData
            
            return cell
        // 他はコメントを表示
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier(commentReuseIdentifier, forIndexPath: indexPath) as! CommentTableViewCell
            cell.commentData = commentArray[indexPath.row-1] // 本来、0の次の[1番目]に表示したいデータはArrayの0に相当するので-1する
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
        // 初めだけ異なるセル
        case 0:
            return 210
        default:
            return 80
        }
    }


}
