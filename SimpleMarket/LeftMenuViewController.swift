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
    
    private var userImageButton: UIButton! // ユーザーイメージ（ボタン）
    
    // 注意。このスライド上でSegueとかで移動すると、ページ構成が崩れる。root画面を作り直す。
    @IBAction func handleToTop(sender: AnyObject) {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()! as UIViewController
        UIApplication.sharedApplication().keyWindow?.rootViewController = view
        UIApplication.sharedApplication().keyWindow?.makeKeyWindow()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUserImageButton()
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

    
}
