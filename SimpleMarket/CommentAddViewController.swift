//
//  CommentAddViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/09/05.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit

// コメント
class CommentAddViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var toOrderDetailButton: UIButton!
    
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
        
        // ボタンに右アイコン追加
        let image = UIImage.fontAwesomeIconWithName(.ChevronRight, textColor: UIColor.blackColor(), size: CGSizeMake(25, 25))
        toOrderDetailButton.setImage(image, forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
