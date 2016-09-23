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

    @IBOutlet weak var imageView1: UIImageView!
    var image1: UIImage!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var priceTextField: UITextField!
    
    //var orderData: OrderData!
    
    // 出品する
    @IBAction func handleSubmitButton(sender: AnyObject) {

        let orderRef = FIRDatabase.database().reference().child(CommonConst.OrderPATH)
        
        // image1
        var imageString = ""
        if imageView1.image != nil {
            let imageData = UIImageJPEGRepresentation(imageView1.image!, 0.5) // 圧縮率0.5
            imageString = imageData!.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
        }
        
        let name = nameTextField.text // String?型なのでアンラップする
        let body = bodyTextView.text
        let price = priceTextField.text // String?
        let modified = NSDate.timeIntervalSinceReferenceDate()
        let created = NSDate.timeIntervalSinceReferenceDate()

        // status:0は出品中
        let data = [
            "image": imageString,
            "name": name!, "body": body, "price": price!, "status": "0", "modified": modified, "created": created]
        orderRef.childByAutoId().setValue(data)
        
        //SVProgressHUD.showSuccessWithStatus("出品しました")
        let view = self.storyboard?.instantiateViewControllerWithIdentifier("OrderAddThanks")
        presentViewController(view!, animated: true, completion: nil) // モーダル
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // test値
        nameTextField.text = "no name"
        bodyTextView.text = "no body"
        priceTextField.text = "100"
        
        // imageのセット
        imageView1.image = image1
        
        // tapイベントを検出する
        imageView1.userInteractionEnabled = true // タップできるようにする
        let myTap = UITapGestureRecognizer(target: self, action: #selector(imageTap))
        imageView1.addGestureRecognizer(myTap)
    }
    
    override func viewWillAppear(animated: Bool) {
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ImageSelectSegue" {
            print("segue ImageAdd")
        }
        
    }
    
    // imageタップ
    func imageTap() {
        performSegueWithIdentifier("ImageSelectSegue", sender: nil)
    }
    
    
}
