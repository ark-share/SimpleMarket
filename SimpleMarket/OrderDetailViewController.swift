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
    
    var orderData: OrderData! // データを受け取って表示
    

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
            
            // コメント数は？
            print("comments = \(orderData.comment_count!)")
            commentButton.setTitle("コメント \(orderData.comment_count!)", forState: .Normal)

        }
        
        // コメントボタンに吹き出し追加
        let image = UIImage.fontAwesomeIconWithName(.CommentO, textColor: UIColor.blackColor(), size: CGSizeMake(22, 22))
        commentButton.setImage(image, forState: .Normal)
        
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
            let view = segue.destinationViewController as! CommentAddViewController
            view.orderData = self.orderData
        }
        // to OrderBuySegue
        if segue.identifier == "OrderBuySegue" {
            // orderDataを「そのまま」引き継ぐ
            let view = segue.destinationViewController as! OrderBuyViewController
            view.orderData = self.orderData
        }
        
    }

}
