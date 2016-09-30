//
//  TradeSellDetailViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/09/26.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit

class TradeSellDetailViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var infoTextView: UITextView!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var postedButton: UIButton!
    
    var orderData: OrderData!
    
    // 発送済み
    @IBAction func handlePosted(sender: AnyObject) {
        // ステータスを 2 → 3：発送済み に
        self.orderData.saveField("status", value: "3")
        
        // trade_commentsにも流す
        if orderData.id != nil {
            self.orderData.saveTradeComment(orderData.id!, body: "(発送しました)")
        }
        
        self.navigationController?.popViewControllerAnimated(true) // 前の画面へ
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if orderData != nil {
//            if orderData.image != nil {
//                imageView.image = orderData.image!
//            }
//            if orderData.price != nil {
//                priceLabel.text = orderData.price
//            }
//            if orderData.name != nil {
//                nameLabel.text = orderData.name
//            }
            if orderData.status != nil {
                statusLabel.text = orderData.statusName
                
                // 案内メッセージ
                infoTextView.text = AppController().getInfoMessageforSell(orderData.status!)
            }
            
            // コメント数は？
            if orderData.trade_comment_count! > 0 {
                commentButton.setTitle("コメント \(orderData.trade_comment_count!)", forState: .Normal)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // to OrderCommentAddSegue
        if segue.identifier == "TradeCommentAddSegue" {
            // orderDataを「そのまま」引き継ぐ
            let view = segue.destinationViewController as! TradeCommentAddViewController
            view.orderData = self.orderData
        }
    }

}
