//
//  ViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/16.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

// 初期画面
class ViewController: UIViewController {

    // 新規出品ボタン
    @IBAction func handleOrderAddButton(sender: AnyObject) {
        // 移動
        let view = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("OrderAdd") as UIViewController
        presentViewController(view, animated: true, completion: nil)
    }
    @IBAction func handleOrderIndexButton(sender: AnyObject) {
        // 移動
        //let view = UIStoryboard(name: "Order", bundle: nil).instantiateInitialViewController()! as UIViewController // navが消えないように先にnavを呼ぶ
        let view = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("OrderIndex") as UIViewController // 飛び先でnavを用意しなおせた
        presentViewController(view, animated: true, completion: nil)
        
        // nav, slideを維持して移動
//        let slide = SlideMenuController(mainViewController: view, leftMenuViewController: self.slideMenuController()!.leftViewController!)
//        UIApplication.sharedApplication().keyWindow?.rootViewController = slide
        
    }
    
    @IBAction func handleOrderIndexBuy(sender: AnyObject) {
        // 移動
        let view = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("OrderIndexBuy") as UIViewController
        presentViewController(view, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        // slide用のbar準備
        let image = UIImage(named: "bars")
        self.addLeftBarButtonWithImage(image!)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
}

