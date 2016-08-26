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
        // 移動
        let view = self.storyboard!.instantiateViewControllerWithIdentifier("OrderAdd") as UIViewController
        presentViewController(view, animated: true, completion: nil)
    }
    
    @IBAction func handleOrderIndexButton(sender: AnyObject) {
        // 移動
        //let view = self.storyboard!.instantiateInitialViewController()! as UIViewController // navが消えないように先にnavを呼ぶ
        let view = self.storyboard!.instantiateViewControllerWithIdentifier("OrderIndex") as UIViewController // 移動先でnavを用意するようにしたので直接OrderIndexを呼び出せる
        presentViewController(view, animated: true, completion: nil)
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
