//
//  CommonConst.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/16.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import Foundation

struct CommonConst {
    // データベース
    static let OrderPATH = "orders"
    static let CommentPATH = "comments"
    
    static let DisplayNameKey = "DISPLAYNAME" // 表示名
    static let BuyPaymentKey = "BUY_PAYMENT" // 支払い方法
    static let BuyPaymentArray: [Int: String] = [0:"コンビニ決済", 1:"銀行決済", 2:"クレジットカード決済"]
    static let BuyAddressKey = "BUY_ADDRESS" // 配送先
    
    
}