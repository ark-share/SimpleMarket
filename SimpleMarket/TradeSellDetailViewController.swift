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
                infoTextView.text = AppController().getInfoMessageforSell(orderData.status!)
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
