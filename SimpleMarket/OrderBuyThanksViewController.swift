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
    
    @IBAction func handleTradeBuyDetail(sender: AnyObject) {
        // navが裏に隠れないように全面作り直す また、戻る画面は「購入リスト」に変わる
        let index = UIStoryboard(name: "Trade", bundle: nil).instantiateViewControllerWithIdentifier("TradeBuyIndex")
        UIApplication.sharedApplication().keyWindow?.rootViewController = index
        UIApplication.sharedApplication().keyWindow?.makeKeyWindow()
        
        // navを引き継ぐ(indexページにdetailを付与する
        let detail = UIStoryboard(name: "Trade", bundle: nil).instantiateViewControllerWithIdentifier("TradeBuyDetail") as! TradeBuyDetailViewController
        detail.orderData = self.orderData
        index.navigationController?.pushViewController(detail, animated: true)
    }
    
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


}
