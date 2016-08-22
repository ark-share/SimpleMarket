//
//  OrderIndexViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/16.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD


class OrderIndexViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var orderArray: [OrderData] = [] // Cellでは1件のデータ。ここでは一覧用に複数保持
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // ordersに要素が追加されたらクロージャ呼び出す
        FIRDatabase.database().reference().child(CommonConst.OrderPATH).observeEventType(.ChildAdded, withBlock: { snapshot in
            
            // データを設定する
            //if let uid = FIRAuth.auth()?.currentUser?.uid {
                let data = OrderData(snapshot: snapshot) //, myId: uid
                self.orderArray.insert(data, atIndex: 0)
                
                self.collectionView.reloadData() // 再表示
            //}
            
        })

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Collection
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // 再利用できるセルを作る
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("OrderCell", forIndexPath: indexPath)
        let data = orderArray[indexPath.row]
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        if data.image != nil {
            imageView.image = data.image!
        }
        let priceLabel = cell.viewWithTag(2) as! UILabel
        if data.price != nil {
            priceLabel.text = "\(data.price!) 円"
        }
        let nameLabel = cell.viewWithTag(3) as! UILabel
        if data.name != nil {
            nameLabel.text = data.name!
        }
            
        cell.layoutIfNeeded()
        return cell
    }
    // section数？
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    // sectionに応じたセルの数を返す
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orderArray.count
    }
    // screenサイズに合わせて整える
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellSize:CGFloat = self.view.frame.size.width / 2 - 10
        
        // 縦横同じ
        return CGSizeMake(cellSize, cellSize)
    }
    
    
}
