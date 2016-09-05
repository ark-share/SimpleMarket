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

        print(self.navigationController?.viewControllers)
    }
    
    override func viewWillAppear(animated: Bool) {
        
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

