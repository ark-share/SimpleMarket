//
//  OrderIndexBuyViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/24.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import PageMenu

class OrderIndexBuyViewController: UIViewController {
    
    var pageMenu: CAPSPageMenu?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        makePageMenu()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func makePageMenu() {
        var controllers: [UIViewController] = []
        
        for i in 1...3 {
            let cv = BuyTableViewController(nibName: "BuyTableViewController", bundle: nil)
            cv.title = "menu" + String(i)
            controllers.append(cv)
        }
        
        let params: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor.blackColor()),
            .MenuHeight(80.0),
            .MenuItemWidth(90.0),
            .CenterMenuItems(true)
        ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllers, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: params)
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        pageMenu!.didMoveToParentViewController(self)
        
    }

}
