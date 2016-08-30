//
//  OrderIndexBuyViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/24.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

// 購入リスト
class OrderIndexBuyViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        
        scrollView.frame = CGRectMake(0, 0, self.view.frame.width, scrollView.frame.height) // スクロールの横幅を画面に合わせる 縦は変更しない 親ビューはwidth414なのに scrollのwidthが誤って600になってしまうため
        scrollView.contentSize = CGSizeMake(self.view.frame.width * 3, scrollView.frame.height) // 3画面
        scrollView.pagingEnabled = true
        
        makeTableViewByPage(0)
        makeTableViewByPage(1)
        makeTableViewByPage(2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
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
    
    
    func makeTableViewByPage(page: Int) {
        
        //let table = BuyTableViewController(nibName: "BuyTableViewController", bundle: nil) nibじゃなくてもいい
        let table = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("BuyTable") as! BuyTableViewController

        // view配置
        table.view.frame = CGRectMake(self.view.frame.width * CGFloat(page), 0, self.view.frame.width, scrollView.frame.height)
        
        self.addChildViewController(table)

        //self.scrollView.addSubview(table) ×これだとControllerを渡してしまう。UIViewを渡す
        self.scrollView.addSubview(table.view)
        table.didMoveToParentViewController(self) // 追加の完了を伝える
    }

    
}
