//
//  OrderDetailTableViewCell.swift
//  SimpleMarket
//
//  Created by macpc on 2016/09/09.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit

// コメントに隣接する商品詳細セル
class OrderDetailTableViewCell: UITableViewCell {

    //@IBOutlet weak var imageView: UIImageView! もともとimageViewは定義されてる？
    @IBOutlet weak var orderImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var orderDetailButton: UIButton!
    
    var orderData: OrderData! // 前の画面からdataを受け取る
    
    @IBAction func handleOrderDetail(sender: AnyObject) {
        // ただの戻るボタンじゃないかも。ナビやスライドを裏に用意した上に詳細ページも出さないといけない？
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // コメントボタンに吹き出し追加
        let image = UIImage.fontAwesomeIconWithName(.ChevronRight, textColor: UIColor.blackColor(), size: CGSizeMake(22, 22))
        orderDetailButton.setImage(image, forState: .Normal)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        
        if orderData.image != nil {
            imageView!.image = orderData.image
        }
        if orderData.price != nil {
            priceLabel.text = orderData.price
        }
        if orderData.name != nil {
            nameLabel.text = orderData.name
        }
        
        super.layoutSubviews()
    }
    
}
