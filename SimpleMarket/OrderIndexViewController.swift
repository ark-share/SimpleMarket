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
    private var tabButtons: [UIButton] = [] // メニュー複数
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        print(self.view.frame.height)
        print(self.scrollView.frame.height)

        scrollView.frame = CGRectMake(0, 0, self.view.frame.width, scrollView.frame.height) // スクロールの横幅を画面に合わせる 縦は変更しない 親ビューはwidth414なのに scrollのwidthが誤って600になってしまうため
        scrollView.contentSize = CGSizeMake(self.view.frame.width * 3, scrollView.frame.height) // 3画面
        scrollView.pagingEnabled = true
        
        makeCollectionViewByPage(0)
        makeCollectionViewByPage(1)
        makeCollectionViewByPage(2)
        
        makeTabButtonByPage(0)
        makeTabButtonByPage(1)
        makeTabButtonByPage(2)
        
        makeAddButton()
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
    
    // コンテンツの生成
    func makeCollectionViewByPage(page: Int) {
        
        //let collection = OrderIndexCollectionViewController(nibName: "xxx", bundle: nil) nibじゃなくてもいい
        let collection = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("OrderCollection") as! OrderIndexCollectionViewController

        // view配置
        collection.view.frame = CGRectMake(self.view.frame.width * CGFloat(page), 0, self.view.frame.width, scrollView.frame.height)
        
        self.addChildViewController(collection)
        
        //self.scrollView.addSubview(collection) ×これだとControllerを渡してしまう。UIViewを渡す
        self.scrollView.addSubview(collection.view)
        collection.didMoveToParentViewController(self) // 追加の完了を伝える
    }
    // tab buttonの生成
    func makeTabButtonByPage(page: Int) {
        let tabButton = UIButton()
        tabButton.frame = CGRectMake(0, 0, self.view.frame.width / 3, 40) // 位置も指定できるが、ボタンのサイズだけ
        
        // centerの位置を指定してボタン配置（ボタンが３つなら４で割った位置へ＝ 1/4, 2/4, 3/4 それぞれボタンが配置される）
        tabButton.center = CGPointMake(self.view.frame.width / 4 * CGFloat(page + 1), 40)
        
        // タイトル通常時
        tabButton.setTitle("ボタン", forState: .Normal)
        tabButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        tabButton.tag = page // 1, 2, 3
        
        // イベント追加
        tabButton.addTarget(self, action: #selector(self.handleTabButton(_:event:)), forControlEvents: .TouchUpInside)
        
        self.headerView.addSubview(tabButton)
    }
    // tab buttonのアクション
    func handleTabButton(sender: UIButton, event:UIEvent) {
        print("tab button click!")
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
        // 移動?
        let add = self.storyboard!.instantiateViewControllerWithIdentifier("OrderAdd") as UIViewController
        //presentViewController(view, animated: true, completion: nil)
        
        self.addChildViewController(add)
        self.view.addSubview(add.view)
    }
    
}
