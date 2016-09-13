//
//  OrderDetailBuyViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/09/12.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import WebPay

class OrderDetailBuyViewController: UIViewController {

    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var orderData: OrderData!
    let card = WPYCreditCard()
    private var price = 120

    // 支払い方法ボタン
    @IBAction func handlePaymentButton(sender: AnyObject) {
        print("to payment")
    }
    // 配送先ボタン
    @IBAction func handleAddressButton(sender: AnyObject) {
        print("to address")
    }
    // 購入するボタン
    @IBAction func handleBuyButton(sender: AnyObject) {
        
        card.number = "4242 4242 4242 4242"
        card.expiryMonth = WPYMonth(rawValue: 8)!
        card.expiryYear = 2017
        card.cvc = "123"
        card.name = "TARO YAMADA"
        
        let paymentViewController = WPYPaymentViewController(priceTag: "¥"+String(price), card: card, callback: { viewController, token, error in
            if let newError = error {
                print("error:\(newError.localizedDescription)")
            } else {
                // 結果がcallbackで渡される。ここでTokenを受け取る
                print("token = \(token.tokenId)")
                self.charge(token.tokenId)
                
                // when transaction is complete
                viewController.setPayButtonComplete()
                viewController.dismissAfterDelay(2.0)
            }
        })
        
        //self.navigationController?.pushViewController(paymentViewController, animated: true)
        self.presentViewController(paymentViewController, animated: true, completion: nil)
        
    }
    
    func charge(token: String){
        WebpayClient.charge(price, token: token) { isSuccess in
            if isSuccess {
                print("succeeded. Check your dashboard")
            }else{
                print("failed. Check logs.")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("buy \(orderData.name!)")

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
