//
//  InputAddressViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/10/12.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit

class InputAddressViewController: UIViewController {

    @IBOutlet weak var addressField: UITextView!
    
    // 保存して戻る
    @IBAction func handleSubmit(sender: AnyObject) {
        AppController().buyAddress = addressField.text!
        self.navigationController?.popViewControllerAnimated(true) // 前の画面へ
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
