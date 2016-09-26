//
//  TradeSellIndexCell.swift
//  SimpleMarket
//
//  Created by macpc on 2016/09/26.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit

class TradeSellIndexCell: UITableViewCell {

    @IBOutlet weak var orderImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var orderData: OrderData!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        
        if orderData.image != nil {
            orderImageView.image = orderData.image
        }
        if orderData.price != nil {
            priceLabel.text = orderData.price
        }
        if orderData.name != nil {
            nameLabel.text = orderData.name
        }
        if orderData.status != nil {
            statusLabel.text = orderData.status
        }
        
        super.layoutSubviews()
    }
}
