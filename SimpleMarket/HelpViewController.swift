//
//  HelpViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/10/05.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

// ヘルプ
class HelpViewController: UIViewController, UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // WebView
        requestUrl("http://f-share.jp/pages/disclaimer")

        makeNavigation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func requestUrl(stringUrl: String) {
        let web: UIWebView = UIWebView()
        web.delegate = self
        
        web.frame = self.view.bounds
        self.view.addSubview(web)
        
        let url = NSURL(string: stringUrl) // URL
        let request = NSURLRequest(URL: url!)
        web.loadRequest(request)
        
        // config
        //web.scrollView.bounces = false
    }
    
    // ナビの生成
    func makeNavigation() {
        
        // slide用のbar準備
        let image = UIImage.fontAwesomeIconWithName(.Bars, textColor: UIColor.blackColor(), size: CGSizeMake(30, 30))
        self.addLeftBarButtonWithImage(image)
        
        // navを用意
        let nav = UINavigationController(rootViewController: self)
        
        // スライドを用意
        let leftMenu = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LeftMenu") as! LeftMenuViewController
        let slide = SlideMenuController(mainViewController: nav, leftMenuViewController: leftMenu)
        
        UIApplication.sharedApplication().keyWindow?.rootViewController = slide
    }

    func webViewDidFinishLoad(webView: UIWebView) {
        print("loaded!")
    }

}
