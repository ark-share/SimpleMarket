//
//  OrderBuyViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/09/12.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import WebPay
import SVProgressHUD
import Firebase
import FirebaseDatabase

class OrderBuyViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var orderData: OrderData!
    var selectedPayment: String!
    let card = WPYCreditCard()

    // 支払い方法ボタン
    @IBAction func handlePaymentButton(sender: AnyObject) {
        print("to payment")
        
        // navを引き継ぐ
        let payment = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("SelectPayment") as! SelectPaymentViewController
        self.navigationController?.pushViewController(payment, animated: true)
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
        
        // 表示価格はorderData.price
        let paymentViewController = WPYPaymentViewController(priceTag: "¥"+orderData.price!, card: card, callback: { viewController, token, error in
            if let newError = error {
                print("error:\(newError.localizedDescription)")
                
                SVProgressHUD.showErrorWithStatus("\(newError.localizedDescription)")
            } else {
                // 結果がcallbackで渡される。ここでTokenを受け取る
                print("token = \(token.tokenId)")
                self.charge(token.tokenId)
                
                self.boughtOrder("2")
                
                // when transaction is complete
                viewController.setPayButtonComplete()
                viewController.dismissAfterDelay(2.0)
            }
        })
        
        // navを引き継ぐ
        self.navigationController?.pushViewController(paymentViewController, animated: true)
    }
    
    func charge(token: String){
        // チャージ金額はorderData.price
        WebpayClient.charge(Int(orderData.price!)!, token: token) { isSuccess in
            if isSuccess {
                print("succeeded. Check your dashboard")
                
                // presentViewControllerだと、次の画面に遷移されない？全面作り直す
                let view = self.storyboard!.instantiateViewControllerWithIdentifier("OrderBuyThanks") as! OrderBuyThanksViewController
                view.orderData = self.orderData!
                UIApplication.sharedApplication().keyWindow?.rootViewController = view
                UIApplication.sharedApplication().keyWindow?.makeKeyWindow()
                
            }else{
                print("failed. Check logs.")
            }
        }
    }
    
    private func boughtOrder(status: String) {
        let user_id = FIRAuth.auth()?.currentUser?.uid
        let user_name = FIRAuth.auth()?.currentUser?.displayName
        
        // ステータスを 2：決済済み に
        self.orderData.saveField("status", value: status) // 決済済みにするなら2をセット
    
        let  datas = ["buy_user_id":user_id!, "buy_user_name":user_name!]
        self.orderData.save(datas) // 複数一括保存
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if orderData != nil {
            if orderData.image != nil {
                imageView.image = orderData.image!
            }
        }

        // 設定なければ(-1)なら銀行をセッット
        if AppController().buyPayment < 0 {
            AppController().buyPayment = 1 // 初期設定あればここでセット
        }
        paymentLabel.text = CommonConst.BuyPaymentArray[ AppController().buyPayment ]

        AppController().buyAddress = "大阪府大阪市北区"
        addressLabel.text = AppController().buyAddress
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        viewDidLoad() // 戻ってきても画面更新する
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
