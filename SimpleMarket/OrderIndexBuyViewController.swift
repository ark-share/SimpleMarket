//
//  OrderIndexBuyViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/24.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit

// 購入リスト
class OrderIndexBuyViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        
        scrollView.contentSize = CGSizeMake(self.view.frame.width * 3, self.scrollView.frame.height) // 3画面
        scrollView.pagingEnabled = true
        
        makeTableViewByPage(0)
        makeTableViewByPage(1)
        makeTableViewByPage(2)
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeTableViewByPage(page: Int) {
        
        //let table = BuyTableViewController(nibName: "BuyTableViewController", bundle: nil) nibじゃなくてもいい
        let table = UIStoryboard(name: "Order", bundle: nil).instantiateViewControllerWithIdentifier("BuyTable") as! BuyTableViewController

        let frame = CGRectMake(self.view.frame.width * CGFloat(page), 0, self.scrollView.frame.width, self.scrollView.frame.height)
        table.view.frame = frame // table配置
        
        self.addChildViewController(table)

        //self.scrollView.addSubview(table) ×これだとControllerを渡してしまう。UIViewを渡す
        self.scrollView.addSubview(table.view)
        table.didMoveToParentViewController(self) // 追加の完了を伝える
    }

    
}
