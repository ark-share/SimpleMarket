//
//  TradeSellTableViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/09/26.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

private let reuseIdentifier = "TradeSellCell"

class TradeSellTableViewController: UITableViewController {

    var orderArray: [OrderData] = [] // 一覧用データ
    var statusArray: [String] = [] // 表示するステータスの商品
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // cell
        let nib = UINib(nibName: "TradeSellIndexCell", bundle: nil) // Xibファイルの名前
        tableView.registerNib(nib, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension // 高さ自動

        // ordersに要素が追加されたらクロージャ呼び出す
        FIRDatabase.database().reference().child(CommonConst.OrderPATH).observeEventType(.ChildAdded, withBlock: { snapshot in
            
            // データを設定する
            //if let uid = FIRAuth.auth()?.currentUser?.uid {
            let data = OrderData(snapshot: snapshot) //, myId: uid
            // statusの中に指定したステータスがあるかどうか　たとえばarrayが[1,2]の場合、statusが1や2だったら表示される
            if data.status != nil {
                if (self.statusArray.indexOf(data.status!) != nil) {
                    self.orderArray.insert(data, atIndex: 0)
                }
            }
            self.tableView.reloadData() // 再表示
            //}
        })
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
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! TradeSellIndexCell
        cell.orderData = orderArray[indexPath.row]
        
        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }

    // セルから直にSegueを引いた場合はここは要らない。２回詳細ページが呼ばれてしまう
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("TradeSellDetailSegue", sender: nil)
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vc = segue.destinationViewController as! TradeSellDetailViewController
        
        if segue.identifier == "TradeSellDetailSegue" {
            // orderDataを引き継ぐ
            let indexPath = self.tableView.indexPathForSelectedRow // どのセルを押した？
            vc.orderData = self.orderArray[indexPath!.row]
        }
    }

}
