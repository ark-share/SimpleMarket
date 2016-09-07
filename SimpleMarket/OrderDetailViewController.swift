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
    @IBOutlet weak var commentButton: UIButton!
    
    
    var orderData: OrderData!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        // コメントボタンに吹き出し追加 storyboardeでも追加できるかも
//        let image = UIImage.fontAwesomeIconWithName(.CommentO, textColor: UIColor.blackColor(), size: CGSizeMake(25, 25))
//        commentButton.setImage(image, forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // to CommentAddSegue
        if segue.identifier == "CommentAddSegue" {
            // orderDataを「そのまま」引き継ぐ
            let commentAddViewController = segue.destinationViewController as! CommentAddViewController
            commentAddViewController.orderData = self.orderData
        }
        
    }

}
