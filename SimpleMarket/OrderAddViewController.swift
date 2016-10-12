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
        
        addOrder()
        
        //SVProgressHUD.showSuccessWithStatus("出品しました")
        let thank = self.storyboard?.instantiateViewControllerWithIdentifier("OrderAddThanks") as! OrderAddThanksViewController
        //thank.orderData = newData 保存したてのデータが取れない
        presentViewController(thank, animated: true, completion: nil) // モーダル
    }
    
    // 出品 autoidを返す
    private func addOrder() -> String {
        let ref = FIRDatabase.database().reference().child(CommonConst.OrderPATH)
        let autoid = ref.childByAutoId()
        
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
        
        let user_id = FIRAuth.auth()?.currentUser?.uid
        let user_name = FIRAuth.auth()?.currentUser?.displayName
        
        // status:0は出品中
        let data = [
            "image": imageString,
            "name": name!, "body": body, "price": price!, "status": "0",
            "user_id": user_id!, "user_name": user_name!,
            "modified": modified, "created": created]
        //ref.child(id).setValue(data) // childByAutoId は使わない 共通の商品idを使う
        
        autoid.setValue(data)
        print("autoid = \(autoid.key)")
        
        return autoid.key
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
        
        // 背景タップ
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
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
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
}
