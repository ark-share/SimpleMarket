//
//  UserLoginViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/29.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD


class UserLoginViewController: UIViewController {
    
    @IBOutlet weak var mailAddressText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var displayNameText: UITextField!
    
    // ログイン
    @IBAction func handleLoginButton(sender: AnyObject) {
        // nilチェック
        if let address = mailAddressText.text, let password = passwordText.text {
            
            // どれかemptyなら実行しない
            if address.characters.isEmpty || password.characters.isEmpty {
                SVProgressHUD.showErrorWithStatus("必須項目を入力してください")
                return  // メソッドを抜ける
            }
            
            // 簡単なvalidate TODO:Userモデルを作ってその中でValidate判定するのがいいかも 形式にマッチしなければvalidationErrorsか何かにエラーメッセージごと入れておく
            if password.characters.count < 6 {
                SVProgressHUD.showErrorWithStatus("パスワードは6字以上で入力してください")
                return  // メソッドを抜ける
            }
            
            // Firebase
            FIRAuth.auth()?.signInWithEmail(address, password: password) { user, error in
                if error != nil {
                    SVProgressHUD.showErrorWithStatus("ログインに失敗しました")
                    print(error)
                }
                else {
                    // NSUserDefaultsに保存して画面を閉じる
                    if let displayName = user?.displayName {
                        AppController().setDisplayName(displayName)
                    }
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            }
            
        }

    }
    
    // アカウント登録
    @IBAction func handleCreateUserButton(sender: AnyObject) {
        // nilチェック
        if let address = mailAddressText.text, let password = passwordText.text, let displayName = displayNameText.text {
            
            // どれかemptyなら実行しない
            if address.characters.isEmpty || password.characters.isEmpty || displayName.characters.isEmpty {
                SVProgressHUD.showErrorWithStatus("必須項目を入力してください")
                return  // メソッドを抜ける
            }
            
            // 簡単なvalidate
            if password.characters.count < 6 {
                SVProgressHUD.showErrorWithStatus("パスワードは6字以上で入力してください")
                return  // メソッドを抜ける
            }
            
            SVProgressHUD.show()
            
            // Firebase
            FIRAuth.auth()?.createUserWithEmail(address, password: password) { user, error in
                if error != nil {
                    // 登録に失敗
                    if let error = error!.userInfo["NSLocalizedDescription"] {
                        SVProgressHUD.showErrorWithStatus(String(error))
                    }
                    //print(error)
                }
                else {
                    
                    // 登録できたらそのままログインする
                    FIRAuth.auth()?.signInWithEmail(address, password: password) { user, error in
                        if error != nil {
                            SVProgressHUD.showErrorWithStatus("ログインに失敗しました")
                            print(error)
                        }
                        else {
                    
                            if let user = user {
                                // Fireに表示名を保存する
                                let request = user.profileChangeRequest()
                                request.displayName = displayName
                                request.commitChangesWithCompletion() { error in
                                    if error != nil {
                                        print(error)
                                    }
                                    else {
                                        // HUDを消す
                                        SVProgressHUD.dismiss()
                                        
                                        // NSUserDefaultsに保存して画面を閉じる
                                        AppController().setDisplayName(displayName)
                                        self.dismissViewControllerAnimated(true, completion: nil)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
    
    // Sign Out
    func logout() {
        try! FIRAuth.auth()?.signOut()
    }
    
    // 戻る
    @IBAction func handleBackButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // test
        mailAddressText.text = "aaa@aaa.com"
        passwordText.text = "aaaaaa"
        displayNameText.text = "aaa"


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
