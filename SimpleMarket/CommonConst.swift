//
//  CommonConst.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/16.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import Foundation

struct CommonConst {
    // 商品
    static let OrderPATH = "orders"
    static let OrderStatusArray: [Int: String] = [0:"出品中", 1:"入金待ち", 2:"決済済み/未発送", 3:"配達待ち/発送済み", 4:"受取評価待ち/配達済み", 5:"完了評価待ち", 6:"取引完了"]
    static let OrderCommentPATH = "order_comments"
    static let TradeCommentPATH = "trade_comments"
    
    // ユーザー
    static let UserPATH = "users"
    
    
    // Adobe
    static let ADOBE_CLIENT_SECRET = "57e6fc93-3f82-405e-95fb-999f53f1a68d"
    static let ADOBE_CLIENT_ID = "fc17518c14534c1b9000e3da0ea90ca4"
    
    // Key, Array
    static let DisplayNameKey = "DISPLAYNAME" // 表示名
    static let BuyPaymentKey = "BUY_PAYMENT" // 支払い方法
    static let BuyPaymentArray: [Int: String] = [0:"コンビニ決済", 1:"銀行決済", 2:"クレジットカード決済"]
    static let BuyAddressKey = "BUY_ADDRESS" // 配送先
    
    
}
