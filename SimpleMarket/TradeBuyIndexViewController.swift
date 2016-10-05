//
//  TradeBuyIndexViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/24.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

// 購入リスト
class TradeBuyIndexViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var tabButtons: [UIButton] = [] // メニュー複数
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        scrollView.frame = CGRectMake(0, 0, self.view.frame.width, scrollView.frame.height) // スクロールの横幅を画面に合わせる
        scrollView.contentSize = CGSizeMake(self.view.frame.width * 3, scrollView.frame.height) // 3画面
        scrollView.pagingEnabled = true
        
        makeTabButtonByPage(0, title: "入金待ち")
        makeTabButtonByPage(1, title: "取引中")
        makeTabButtonByPage(2, title: "過去の取引")
        
        makeTableViewByPage(0, statusArray: ["1"])
        makeTableViewByPage(1, statusArray: ["2", "3", "4", "5"])
        makeTableViewByPage(2, statusArray: ["6"])
        
        // 選択状態にする
        setSelectedButton(self.tabButtons[0], selected: true)
        
        makeNavigation()

    }

    override func viewWillAppear(animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ナビの生成
    func makeNavigation() {
        
        // nav
        let nav = UINavigationController(rootViewController: self)
        
        // スライドメニュー
        let leftMenu = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LeftMenu") as! LeftMenuViewController
        let slide = SlideMenuController(mainViewController: nav, leftMenuViewController: leftMenu)
        
        // スライドメニューopenボタン
        let image = UIImage.fontAwesomeIconWithName(.Bars, textColor: UIColor.blackColor(), size: CGSizeMake(30, 30))
        self.addLeftBarButtonWithImage(image)
        
        UIApplication.sharedApplication().keyWindow?.rootViewController = slide
    }
    
    // コンテンツの生成
    func makeTableViewByPage(page: Int, statusArray: [String]) {
        
        let table = UIStoryboard(name: "Trade", bundle: nil).instantiateViewControllerWithIdentifier("TradeBuyTable") as! TradeBuyTableViewController

        // 指定ステータスの商品を表示する
        table.statusArray = statusArray
        
        // カウント数変更のため、tabButtonsを渡しておく
        table.tabButton = self.tabButtons[page]
        table.tabTitle = self.tabButtons[page].currentTitle
        
        // view配置
        table.view.frame = CGRectMake(self.view.frame.width * CGFloat(page), 0, self.view.frame.width, scrollView.frame.height)
        
        self.addChildViewController(table)

        //self.scrollView.addSubview(table) ×これだとControllerを渡してしまう。UIViewを渡す
        self.scrollView.addSubview(table.view)
        table.didMoveToParentViewController(self) // 追加の完了を伝える
    }
    // tab buttonの生成
    func makeTabButtonByPage(page: Int, title: String) {
        let tabButton = UIButton()
        tabButton.frame = CGRectMake(0, 0, self.view.frame.width / 3, 40) // 位置も指定できるが、ボタンのサイズだけ
        
        // centerの位置を指定してボタン配置（ボタンが３つなら４で割った位置へ＝ 1/4, 2/4, 3/4 それぞれボタンが配置される）
        tabButton.center = CGPointMake(self.view.frame.width / 4 * CGFloat(page + 1), 40)
        
        // タイトル通常時
        tabButton.setTitle(title, forState: .Normal)
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
    // ドラッグでスクロール後（縦スクロールには反応しない）
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.scrollViewDidEndScrollingAnimation(scrollView) // 同じ
    }
    
}
