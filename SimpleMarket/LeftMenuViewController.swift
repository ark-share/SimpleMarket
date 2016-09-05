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
    
    // 注意。このスライド上でSegueとかで移動すると、ページ構成が崩れる。root画面を作り直す。
    @IBAction func handleToTop(sender: AnyObject) {
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
