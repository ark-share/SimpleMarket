//
//  OrderDetailViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/09/01.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit

// 商品詳細
class OrderDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var orderData: OrderData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(self.navigationController?.viewControllers)

        // Do any additional setup after loading the view.
        if orderData != nil {
            if orderData.image != nil {
                imageView.image = orderData.image!
            }
            if orderData.price != nil {
                priceLabel.text = orderData.price
            }
            if orderData.name != nil {
                nameLabel.text = orderData.name
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
