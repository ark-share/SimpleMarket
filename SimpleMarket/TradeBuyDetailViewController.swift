//
//  BuyTradeViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/09/14.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit

// 購入者、取引画面
class TradeBuyDetailViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var infoTextView: UITextView!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var receivedButton: UIButton! // ステータスによっては非表示に
    
    var orderData: OrderData!

    // 受け取り
    @IBAction func handleReceived(sender: AnyObject) {
        // ステータスを 3 or 4 → 5：完了評価待ち に
        self.orderData.saveField("status", value: "5")
        
        // trade_commentsにも流す
        if orderData.id != nil {
            self.orderData.saveTradeComment(orderData.id!, body: "(受け取りました)")
        }
        
        self.navigationController?.popViewControllerAnimated(true) // 前の画面へ
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.receivedButton.hidden = true

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
                infoTextView.text = AppController().getInfoMessageforBuy(orderData.status!)
                
                // ボタン表示
                if orderData.status! == "3" || orderData.status! == "4" {
                    self.receivedButton.hidden = false // ボタンを有効に
                }
            }
            
            // コメント数は？
            if orderData.trade_comment_count! > 0 {
                commentButton.setTitle("コメント \(orderData.trade_comment_count!)", forState: .Normal)
            }
        }
    }

    override func viewWillAppear(animated: Bool) {
        if orderData != nil {
            
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
