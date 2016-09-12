//
//  OrderDetailBuyViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/09/12.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit

class OrderDetailBuyViewController: UIViewController {

    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var orderData: OrderData!

    // 支払い方法ボタン
    @IBAction func handlePaymentButton(sender: AnyObject) {
        print("to payment")
        
    }
    // 配送先ボタン
    @IBAction func handleAddressButton(sender: AnyObject) {
        print("to address")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 元からクレカを設定しておく
        AppController().buyPayment = 2
        paymentLabel.text = CommonConst.BuyPaymentArray[ AppController().buyPayment ]

        AppController().buyAddress = "大阪府大阪市北区"
        addressLabel.text = AppController().buyAddress
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
