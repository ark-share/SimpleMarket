//
//  CommentTableViewCell.swift
//  SimpleMarket
//
//  Created by macpc on 2016/09/07.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit

// 各コメントのセル
class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var commentData: CommentData!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        
        if commentData.user != nil {
            nameLabel.text = commentData.user
        }
        if commentData.body != nil {
            bodyLabel.text = commentData.body
        }
        
        super.layoutSubviews()
    }
}
