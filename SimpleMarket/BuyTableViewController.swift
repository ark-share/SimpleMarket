//
//  BuyTableViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/26.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

private let reuseIdentifier = "TradeBuyIndexCell"

// 購入リスト（取引中、過去の取引）
class BuyTableViewController: UITableViewController {
    
    var orderArray: [OrderData] = [] // 一覧用データ
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // cell
        let nib = UINib(nibName: "TradeBuyIndexCell", bundle: nil) // Xibファイルの名前
        tableView.registerNib(nib, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension // 高さ自動
        
        // ordersに要素が追加されたらクロージャ呼び出す
        FIRDatabase.database().reference().child(CommonConst.OrderPATH).observeEventType(.ChildAdded, withBlock: { snapshot in
            
            // データを設定する
            //if let uid = FIRAuth.auth()?.currentUser?.uid {
            let data = OrderData(snapshot: snapshot) //, myId: uid
            self.orderArray.insert(data, atIndex: 0)
            
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
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! BuyTableViewCell
        cell.orderData = orderArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    // セルから直にSegueを引いた場合はここは要らない。２回詳細ページが呼ばれてしまう
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("click buy cell")
        performSegueWithIdentifier("TradeBuyDetailSegue", sender: nil)
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
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
