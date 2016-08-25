//
//  OrderAddViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/16.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD

// 新規出品
class OrderAddViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var priceTextField: UITextField!
    
    //var orderData: OrderData!
    
    // 出品する
    @IBAction func handleSubmitButton(sender: AnyObject) {

        let orderRef = FIRDatabase.database().reference().child(CommonConst.OrderPATH)
        
        let name = nameTextField.text // String?型なのでアンラップする？
        let body = bodyTextView.text
        let price = priceTextField.text // String?
        let modified = NSDate.timeIntervalSinceReferenceDate()
        let created = NSDate.timeIntervalSinceReferenceDate()
        
        let data = ["name": name!, "body": body, "price": price!, "modified": modified, "created": created]
        orderRef.childByAutoId().setValue(data)
        
        //SVProgressHUD.showSuccessWithStatus("出品しました")
        let submitViewController = self.storyboard?.instantiateViewControllerWithIdentifier("OrderSubmit")
        presentViewController(submitViewController!, animated: true, completion: nil) // モーダル
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // test値
        nameTextField.text = "no name"
        bodyTextView.text = "no body"
        priceTextField.text = "100"
    }
    
    override func viewWillAppear(animated: Bool) {
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        if segue.identifier == "ImageAddSegue" {
//            print("segue ImageAdd")
//        }
//        
//    }
}
