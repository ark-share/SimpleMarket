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
    private var tabButtons: [UIButton] = [] // メニュー複数
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        
        scrollView.frame = CGRectMake(0, 0, self.view.frame.width, scrollView.frame.height) // スクロールの横幅を画面に合わせる 縦は変更しない 親ビューはwidth414なのに scrollのwidthが誤って600になってしまうため
        scrollView.contentSize = CGSizeMake(self.view.frame.width * 3, scrollView.frame.height) // 3画面
        scrollView.pagingEnabled = true
        
        makeTableViewByPage(0)
        makeTableViewByPage(1)
        makeTableViewByPage(2)
        
        makeTabButtonByPage(0)
        makeTabButtonByPage(1)
        makeTabButtonByPage(2)
        
        // 選択状態にする
        setSelectedButton(self.tabButtons[0], selected: true)
        
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
    
    // コンテンツの生成
    func makeTableViewByPage(page: Int) {
        
        //let table = BuyTableViewController(nibName: "BuyTableViewController", bundle: nil) nibじゃなくてもいい
        let table = self.storyboard!.instantiateViewControllerWithIdentifier("BuyTable") as! BuyTableViewController

        // view配置
        table.view.frame = CGRectMake(self.view.frame.width * CGFloat(page), 0, self.view.frame.width, scrollView.frame.height)
        
        self.addChildViewController(table)

        //self.scrollView.addSubview(table) ×これだとControllerを渡してしまう。UIViewを渡す
        self.scrollView.addSubview(table.view)
        table.didMoveToParentViewController(self) // 追加の完了を伝える
    }
    // tab buttonの生成
    func makeTabButtonByPage(page: Int) {
        let tabButton = UIButton()
        tabButton.frame = CGRectMake(0, 0, self.view.frame.width / 3, 40) // 位置も指定できるが、ボタンのサイズだけ
        
        // centerの位置を指定してボタン配置（ボタンが３つなら４で割った位置へ＝ 1/4, 2/4, 3/4 それぞれボタンが配置される）
        tabButton.center = CGPointMake(self.view.frame.width / 4 * CGFloat(page + 1), 40)
        
        // タイトル通常時
        tabButton.setTitle("ボタン \(page)", forState: .Normal)
        tabButton.setTitleColor(UIColor.lightGrayColor(), forState: .Normal) // 未選択はグレー
        tabButton.setTitleColor(UIColor.orangeColor(), forState: .Highlighted)
        tabButton.setTitleColor(UIColor.orangeColor(), forState: .Selected)
        
        tabButton.tag = page + 1 // 1, 2, 3
        
        // イベント追加
        tabButton.addTarget(self, action: #selector(self.handleTabButton(_:)), forControlEvents: .TouchUpInside)
        
        self.headerView.addSubview(tabButton)
        self.tabButtons.append(tabButton)
    }
    // tab buttonのアクション
    func handleTabButton(sender: UIButton) {
        let x = self.view.frame.width * CGFloat(sender.tag - 1)
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true) // スクロールのページを変更
    }
    // buttonを選択状態にする
    func setSelectedButton(selectButton: UIButton, selected: Bool) {
        selectButton.selected = selected
        
        // 下線を準備（x = selectButton.frame.size.width / 4 にして左からちょっとスペースを作ってる）
        let border = UIView(frame: CGRectMake(selectButton.frame.size.width / 4, selectButton.frame.size.height - 0.3, selectButton.frame.size.width / 2, 2))
        
        if selected == true {
            border.backgroundColor = UIColor.orangeColor()
            border.accessibilityIdentifier = "border" // borderだけを削除できるように
            selectButton.addSubview(border)
        }
        else {
            for subview in selectButton.subviews {
                // 特定の下位ビューを削除
                if subview.accessibilityIdentifier == "border" {
                    subview.removeFromSuperview()
                }
            }
        }
    }

    // tabボタンでページ移動後
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.width
        for num in 0..<tabButtons.count {
            if page == CGFloat(num) {
                setSelectedButton(tabButtons[num], selected: true) // 選択状態にする
            }
            else {
                setSelectedButton(tabButtons[num], selected: false) // 他ページのボタンは選択解除
            }
        }
    }
    // ドラッグでスクロール後 ＞縦スクロールには反応しない
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.scrollViewDidEndScrollingAnimation(scrollView) // 同じ
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
