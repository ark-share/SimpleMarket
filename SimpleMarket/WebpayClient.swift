//
//  WebpayClient.swift
//  SimpleMarket
//
//  Created by macpc on 2016/09/13.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import Alamofire

class WebpayClient: NSObject {
    static let publicKey = "test_public_d2I2vT8Wdag56lLe6eeGbbDW"
    static let secretKey = "test_secret_6i66afbJL3Zb37g9kZgSUgue"
    
    class func charge(amount: Int, token: String, handler: ((Bool) -> Void)) {
        let param: [String : AnyObject] = ["amount": amount,
                                           "currency" : "jpy",
                                           "capture": true, // すぐに実売り上げにする＝true
                                           "card" : token
                                           ]
        Alamofire.request(.GET, "https://api.webpay.jp/v1/charges", parameters: param, encoding: .URL, headers: ["Authorization": "Bearer \(WebpayClient.secretKey)"])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                handler(response.result.isSuccess)
        }
    }
}
