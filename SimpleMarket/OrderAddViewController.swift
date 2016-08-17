//
//  OrderAddViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/16.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit

class OrderAddViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        self.scrollView.contentSize = CGSize(width: 400, height: 1200) // スクロールに必要
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        if segue.identifier == "OrderAddSegue" {
//            print("segue OrderAdd")
//        }
//        
//    }
}
