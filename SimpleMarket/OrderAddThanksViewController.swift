//
//  OrderSubmitViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/18.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit

// 出品完了
class OrderAddThanksViewController: UIViewController {

    var orderData: OrderData! // 詳細ページを表示するための商品データ
    
    // 続けて出品
    @IBAction func handleOrderAddButton(sender: AnyObject) {
        // navが裏に隠れないように全面作り直す また、戻る画面は「商品一覧」に変わる
        let index = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("OrderIndex")
        UIApplication.sharedApplication().keyWindow?.rootViewController = index
        UIApplication.sharedApplication().keyWindow?.makeKeyWindow()
        
        // navを引き継ぐ(indexページにdetailを付与する
        let detail = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("OrderAdd")
        index.navigationController?.pushViewController(detail, animated: true)
    }
    
    @IBAction func handleOrderIndexButton(sender: AnyObject) {
        // navが裏に隠れないように全面作り直す
        let view = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("OrderIndex") as UIViewController
        UIApplication.sharedApplication().keyWindow?.rootViewController = view
        UIApplication.sharedApplication().keyWindow?.makeKeyWindow()
    }
    
    // 商品詳細へ
    @IBAction func handleOrderDetail(sender: AnyObject) {
        // navが裏に隠れないように全面作り直す また、戻る画面は「商品一覧」に変わる
        let index = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("OrderIndex")
        UIApplication.sharedApplication().keyWindow?.rootViewController = index
        UIApplication.sharedApplication().keyWindow?.makeKeyWindow()
        
        // navを引き継ぐ(indexページにdetailを付与する
        let detail = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("OrderDetail") as! OrderDetailViewController
        detail.orderData = self.orderData
        index.navigationController?.pushViewController(detail, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
