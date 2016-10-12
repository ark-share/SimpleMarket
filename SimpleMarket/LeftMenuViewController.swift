//
//  LeftMenuController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/23.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import Firebase // ログイン ログアウト
import MessageUI // 問い合わせ用

// スライドメニュー
class LeftMenuViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    private var userImageButton: UIButton! // ユーザーイメージ（ボタン）
    
    // 注意。このスライド上でSegueとかで移動すると、ページ構成が崩れる。root画面を作り直す。
    @IBAction func handleToTop(sender: AnyObject) {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()! as UIViewController
        UIApplication.sharedApplication().keyWindow?.rootViewController = view
        UIApplication.sharedApplication().keyWindow?.makeKeyWindow()
    }

    // ログイン
    @IBAction func handleLogin(sender: AnyObject) {
        // modal
        let view = UIStoryboard(name: "User", bundle: nil).instantiateViewControllerWithIdentifier("UserLogin") as UIViewController
        presentViewController(view, animated: true, completion: nil)
        
        self.viewDidLoad() // 閉じるだけでは画面が変わらないので更新する
    }
    // 問い合わせ
    @IBAction func handleContact(sender: AnyObject) {
        if MFMailComposeViewController.canSendMail() == false {
            print("cannot use email.")
            return
        }
        
        let mail = MFMailComposeViewController()
        let to = ["info@ark-share.jp"]
        
        mail.mailComposeDelegate = self // MFMailComposeViewControllerDelegateプロトコルのadoptが必要。紐つけてdeleteのメソッドを利用できるようにする
        mail.setSubject("問い合わせ")
        mail.setToRecipients(to)
        mail.setMessageBody("", isHTML: false)
        self.presentViewController(mail, animated: true, completion: nil)
    }
    // ヘルプページへ
    @IBAction func handleHelp(sender: AnyObject) {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Help") as UIViewController
        UIApplication.sharedApplication().keyWindow?.rootViewController = view
        UIApplication.sharedApplication().keyWindow?.makeKeyWindow()

    }
    // ログアウト
    @IBAction func handleLogout(sender: AnyObject) {
        UserLoginViewController().logout()
        
        AppController().displayName = "" // clear
        //self.viewWillAppear(true)        // reload
        self.viewDidLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUserImageButton()
        
        // ログイン中
        if FIRAuth.auth()?.currentUser != nil {
            
            let displayName = AppController().displayName
            displayNameLabel.text = displayName
            
            loginButton.hidden = true // ログインボタン不要
        }
        // ログインしていない
        else {
            displayNameLabel.hidden = true // 表示名不要
            logoutButton.hidden = true // ログアウトボタン不要
        }
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        viewDidLoad() // 戻ってきても画面更新する
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ユーザーのイメージ画像の部分。ボタンとして作ってみる
    func makeUserImageButton() {
        userImageButton = UIButton()
        userImageButton.frame = CGRectMake(0, 0, 100, 100)
        userImageButton.tintColor = UIColor.whiteColor() // 画像の色がもともと灰色だから白くはならない
        userImageButton.backgroundColor = UIColor.lightGrayColor()
        userImageButton.layer.masksToBounds = true
        userImageButton.layer.cornerRadius = 50.0
        userImageButton.layer.position = CGPoint(x: 75, y: 75)
        userImageButton.tag = 1
        userImageButton.addTarget(self, action:#selector(handleUserImageButton(_:event:)), forControlEvents: .TouchUpInside)
        
        //let image = UIImage(named: "user")
        let image = UIImage.fontAwesomeIconWithName(.User, textColor: UIColor.whiteColor(), size: CGSizeMake(50, 50))
        userImageButton.setImage(image, forState: .Normal)
        
        self.view.addSubview(userImageButton)
    }
    // 固定ボタンからのアクション
    func handleUserImageButton(sender: UIButton, event:UIEvent) {
        // navを引き継ぐ
        let orderAdd = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("OrderAdd")
        self.navigationController?.pushViewController(orderAdd, animated: true)
    }

    // 問い合わせ用 これがないとメールを閉じれない
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {

        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
