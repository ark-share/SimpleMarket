//
//  OrderBuyThanksViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/09/14.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit

// 購入完了
class OrderBuyThanksViewController: UIViewController {

    var orderData: OrderData! // 取引ページを表示するための商品データ
    
    @IBAction func handleOrderIndex(sender: AnyObject) {
        // navが裏に隠れないように全面作り直す
        let view = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("OrderIndex")
        UIApplication.sharedApplication().keyWindow?.rootViewController = view
        UIApplication.sharedApplication().keyWindow?.makeKeyWindow()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(orderData.id!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 取引画面へはSegue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "TradeBuyDetailSegue" {
            // orderDataを「そのまま」引き継ぐ
            let view = segue.destinationViewController as! TradeBuyDetailViewController
            view.orderData = self.orderData
        }
        
    }
}
