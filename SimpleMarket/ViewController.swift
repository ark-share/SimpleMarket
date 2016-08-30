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
    
    // ログインしてたらユーザー名を表示
    @IBOutlet weak var displayNameLabel: UITextField!

    
    @IBAction func handleOrderIndexButton(sender: AnyObject) {
        // modal
        //let view = UIStoryboard(name: "Order", bundle: nil).instantiateInitialViewController()! as UIViewController // navが消えないように先にnavを呼ぶ
        let view = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("OrderIndex") as UIViewController // 飛び先でnavを用意しなおせた
        presentViewController(view, animated: true, completion: nil)
        
        // nav, slideを維持して移動
//        let slide = SlideMenuController(mainViewController: view, leftMenuViewController: self.slideMenuController()!.leftViewController!)
//        UIApplication.sharedApplication().keyWindow?.rootViewController = slide
        
    }
    
    @IBAction func handleOrderIndexBuy(sender: AnyObject) {
        // modal
        let view = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("OrderIndexBuy") as UIViewController
        presentViewController(view, animated: true, completion: nil)
    }
    // ログイン
    @IBAction func handleLoginButton(sender: AnyObject) {
        // modal
        let view = UIStoryboard(name: "User", bundle: nil).instantiateViewControllerWithIdentifier("UserLogin") as UIViewController
        presentViewController(view, animated: true, completion: nil)
    }
    // ログアウト
    @IBAction func handleLogoutButton(sender: AnyObject) {
        UserLoginViewController().logout()
        
        AppController().setDisplayName("") // clear
        
        // reload
        self.viewWillAppear(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(animated: Bool) {
        // slide用のbar準備
        let image = UIImage.fontAwesomeIconWithName(.Bars, textColor: UIColor.blackColor(), size: CGSizeMake(30, 30))
        self.addLeftBarButtonWithImage(image)
        
        let displayName = AppController().getDisplayName()
        displayNameLabel.text = displayName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
}

