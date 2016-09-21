//
//  ImageSelectViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/09/20.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import SVProgressHUD

class ImageSelectViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, AdobeUXImageEditorViewControllerDelegate {

    @IBAction func handleLibrary(sender: AnyObject) {
        // ライブラリを指定してピッカーを開く
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) { // 利用可能かどうか
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            presentViewController(picker, animated: true, completion: nil)
        }
        else {
            SVProgressHUD.showErrorWithStatus("起動できません")
        }
    }
    
    @IBAction func handleCamera(sender: AnyObject) {
        // カメラを指定してピッカーを開く
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) { // 利用可能かどうか
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(picker, animated: true, completion: nil)
        }
        else {
            SVProgressHUD.showErrorWithStatus("起動できません") // シミュレータでは起動不可
        }
    }
    
    @IBAction func handleCancel(sender: AnyObject) {
        // 閉じる
        //dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // 写真を撮影/選択したとき呼ばれる
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("imagepicker")
        
        if info[UIImagePickerControllerOriginalImage] != nil {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            dispatch_async(dispatch_get_main_queue()) {
                let adobe = AdobeUXImageEditorViewController(image: image)
                adobe.delegate = self
                self.presentViewController(adobe, animated: true, completion: nil)
            }
        }
        picker.dismissViewControllerAnimated(true, completion: nil) // 閉じる
        
    }
    
    /* AdobeUXImageEditorViewControllerDelegate */
    // 加工が終わったとき
    func photoEditor(editor: AdobeUXImageEditorViewController, finishedWithImage image: UIImage?) {
        editor.dismissViewControllerAnimated(true, completion: nil) // 閉じる
        
        // 投稿の画像を開く
        let orderAdd = self.storyboard?.instantiateViewControllerWithIdentifier("OrderAdd") as! OrderAddViewController
        orderAdd.image1 = image // この画面に戻って画像を貼り付ける
        presentViewController(orderAdd, animated: true, completion: nil)
    }
    // 加工キャンセルしたとき
    func photoEditorCanceled(editor: AdobeUXImageEditorViewController) {
        editor.dismissViewControllerAnimated(true, completion: nil) // 閉じる
    }
    
}
