//
//  TradeBuyTableViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/26.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

private let reuseIdentifier = "TradeBuyCell"

// 購入リスト（取引中、過去の取引）
class TradeBuyTableViewController: UITableViewController {
    
    
    var orderArray: [OrderData] = [] // 一覧用データ
    var statusArray: [String] = [] // 表示するステータスの商品
    var tabButton: UIButton! // カウント数表示用に受け取る
    var tabTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // cell
        let nib = UINib(nibName: "TradeBuyIndexCell", bundle: nil) // Xibファイルの名前
        tableView.registerNib(nib, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension // 高さ自動
        
        let user_id = FIRAuth.auth()?.currentUser?.uid // 該当ユーザーのデータに限る
        
        // ordersに要素が追加されたらクロージャ呼び出す
        FIRDatabase.database().reference().child(CommonConst.OrderPATH).observeEventType(.ChildAdded, withBlock: { snapshot in
            
            // データを設定する
            //if let uid = FIRAuth.auth()?.currentUser?.uid {
            let data = OrderData(snapshot: snapshot) //, myId: uid
            // statusの中に指定したステータスがあるかどうか　たとえばarrayが[1,2]の場合、statusが1や2だったら表示される
            if data.buy_user_id != nil && data.status != nil {
                if (data.buy_user_id == user_id && self.statusArray.indexOf(data.status!) != nil) {
                    self.orderArray.insert(data, atIndex: 0)
                }
            }
            self.tableView.reloadData() // 再表示
            //}
            
            // カウント数をタブに反映する
            if self.tabButton != nil {
                self.tabButton.setTitle("\(self.tabTitle) \(self.orderArray.count)", forState: .Normal)
            }
        })
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData() // 戻ってきても画面更新する
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return orderArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! TradeBuyIndexCell
        cell.orderData = orderArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    // セルから直にSegueを引いた場合はここは要らない。２回詳細ページが呼ばれてしまう
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("TradeBuyDetailSegue", sender: nil)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vc = segue.destinationViewController as! TradeBuyDetailViewController

        if segue.identifier == "TradeBuyDetailSegue" {
            // orderDataを引き継ぐ
            let indexPath = self.tableView.indexPathForSelectedRow // どのセルを押した？
            vc.orderData = self.orderArray[indexPath!.row]
        }
    }
    
}
