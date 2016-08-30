//
//  LeftMenuController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/23.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit

// スライドメニュー
class LeftMenuViewController: UIViewController {

    @IBAction func handleToTOp(sender: AnyObject) { // TOpになってもた、Topの間違い
        // 移動
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()! as UIViewController
        UIApplication.sharedApplication().keyWindow?.rootViewController = view
        UIApplication.sharedApplication().keyWindow?.makeKeyWindow()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
