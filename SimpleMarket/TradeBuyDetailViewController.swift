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
    
    var orderData: OrderData!
    
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
                infoTextView.text = AppController().getInfoMessageforBuy(orderData.status!)
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
