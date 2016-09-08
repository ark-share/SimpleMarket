//
//  OrderSubmitViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/18.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit

// 出品完了
class OrderSubmitViewController: UIViewController {

    @IBAction func handleOrderAddButton(sender: AnyObject) {
//        let view = self.storyboard!.instantiateViewControllerWithIdentifier("OrderAdd") as UIViewController
//        presentViewController(view, animated: true, completion: nil)
        
        // 出品完了時にモーダル生成してるので、モーダル閉じれば戻れるはず＞ただしこれだと前の入力データが残っているかも
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func handleOrderIndexButton(sender: AnyObject) {
//        let view = self.storyboard!.instantiateViewControllerWithIdentifier("OrderIndex") as UIViewController
//        presentViewController(view, animated: true, completion: nil)
        
        // navが裏に隠れないように全面作り直す
        let view = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("OrderIndex") as UIViewController
        UIApplication.sharedApplication().keyWindow?.rootViewController = view
        UIApplication.sharedApplication().keyWindow?.makeKeyWindow()
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
