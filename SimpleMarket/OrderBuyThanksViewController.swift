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

    var order_id: String! // 取引ページを特定するための商品ID
    
    @IBAction func handleBuyTrade(sender: AnyObject) {
        
    }
    
    @IBAction func handleOrderIndex(sender: AnyObject) {
        // navが裏に隠れないように全面作り直す
        let view = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("OrderIndex")
        UIApplication.sharedApplication().keyWindow?.rootViewController = view
        UIApplication.sharedApplication().keyWindow?.makeKeyWindow()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(order_id!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
