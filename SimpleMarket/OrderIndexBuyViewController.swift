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
    
    private var orderAddButton: UIButton! // 固定ボタン
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        
        scrollView.frame = CGRectMake(0, 0, self.view.frame.width, scrollView.frame.height) // スクロールの横幅を画面に合わせる 縦は変更しない 親ビューはwidth414なのに scrollのwidthが誤って600になってしまうため
        scrollView.contentSize = CGSizeMake(self.view.frame.width * 3, scrollView.frame.height) // 3画面
        scrollView.pagingEnabled = true
        
        makeTableViewByPage(0)
        makeTableViewByPage(1)
        makeTableViewByPage(2)
        
        makeNavigation()
        makeAddButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

 
    // 固定の新規ボタン
    func makeAddButton() {
        orderAddButton = UIButton()
        orderAddButton.frame = CGRectMake(0, 0, 80, 80)
        orderAddButton.tintColor = UIColor.whiteColor() // 画像の色がもともと灰色だから白くはならない
        orderAddButton.backgroundColor = UIColor.orangeColor()
        orderAddButton.layer.masksToBounds = true
        orderAddButton.layer.cornerRadius = 40.0
        orderAddButton.layer.position = CGPoint(x: self.view.frame.width - 60, y: self.view.frame.height - 60)
        orderAddButton.tag = 1
        orderAddButton.addTarget(self, action:#selector(handleOrderAddButton(_:event:)), forControlEvents: .TouchUpInside)
        
        //let image = UIImage(named: "camera")
        let image = UIImage.fontAwesomeIconWithName(.Camera, textColor: UIColor.whiteColor(), size: CGSizeMake(40, 40))
        orderAddButton.setImage(image, forState: .Normal)
        
        self.view.addSubview(orderAddButton)
    }
    func handleOrderAddButton(sender: UIButton, event:UIEvent) {
        // 移動　これだとナビを引き継がない
//        let add = self.storyboard!.instantiateViewControllerWithIdentifier("OrderAdd") as UIViewController
//        presentViewController(add, animated: true, completion: nil)
        
        performSegueWithIdentifier("OrderAddSegue", sender: nil)
    }
    
}
