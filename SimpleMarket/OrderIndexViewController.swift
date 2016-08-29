//
//  OrderIndexViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/16.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import SVProgressHUD
import SlideMenuControllerSwift

// 商品一覧
class OrderIndexViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var orderAddButton: UIButton! // 固定ボタン
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        scrollView.contentSize = CGSizeMake(self.view.frame.width * 3, self.scrollView.frame.height) // 3画面
        scrollView.pagingEnabled = true
        
        makeCollectionViewByPage(0)
        makeCollectionViewByPage(1)
        makeCollectionViewByPage(2)
        
        makeAddButton()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        // slide用のbar準備
        let image = UIImage(named: "bars")
        self.addLeftBarButtonWithImage(image!)
        
        // navを用意
        let nav = UINavigationController(rootViewController: self)
        
        // スライドを用意
        let leftMenu = self.storyboard?.instantiateViewControllerWithIdentifier("LeftMenu") as! LeftMenuViewController
        let slide = SlideMenuController(mainViewController: nav, leftMenuViewController: leftMenu)
        
        UIApplication.sharedApplication().keyWindow?.rootViewController = slide
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeCollectionViewByPage(page: Int) {
        
        //let collection = OrderIndexCollectionViewController(nibName: "xxx", bundle: nil) nibじゃなくてもいい
        let collection = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("OrderCollection") as! OrderIndexCollectionViewController
        
        let frame = CGRectMake(self.view.frame.width * CGFloat(page), 0, self.view.frame.width, self.scrollView.frame.height)
        collection.view.frame = frame // table配置
        
        self.addChildViewController(collection)
        
        //self.scrollView.addSubview(collection) ×これだとControllerを渡してしまう。UIViewを渡す
        self.scrollView.addSubview(collection.collectionView!)
        collection.didMoveToParentViewController(self) // 追加の完了を伝える
    }
    
    // スクロールの検出
    func scrollViewDidScroll(scrollView: UIScrollView) {

        //let y = scrollView.contentOffset.y
        if orderAddButton.hidden != true {
            orderAddButton.hidden = true // 一旦隠す
            
            // 2秒後に表示する
            //makeAddButton()
            NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(self.makeAddButton), userInfo: nil, repeats: false)
        }
    }
    
    // 固定の新規ボタン
    func makeAddButton() {
        orderAddButton = UIButton()
        orderAddButton.frame = CGRectMake(0, 0, 80, 80)
        orderAddButton.tintColor = UIColor.whiteColor() // 画像の色がもともと灰色だから白くはならない
        orderAddButton.backgroundColor = UIColor.redColor()
        orderAddButton.layer.masksToBounds = true
        orderAddButton.layer.cornerRadius = 40.0
        orderAddButton.layer.position = CGPoint(x: self.view.frame.width - 100, y: self.view.frame.height - 100)
        orderAddButton.tag = 1
        orderAddButton.addTarget(self, action:#selector(handleOrderAddButton(_:event:)), forControlEvents: .TouchUpInside)

        let image = UIImage(named: "camera")
        orderAddButton.setImage(image, forState: .Normal)
        
        self.view.addSubview(orderAddButton)
    }
    func handleOrderAddButton(sender: UIButton, event:UIEvent) {
        // 移動
        let add = self.storyboard!.instantiateViewControllerWithIdentifier("OrderAdd") as UIViewController
        //presentViewController(view, animated: true, completion: nil)
        
        self.addChildViewController(add)
        self.view.addSubview(add.view)
    }
    
}
