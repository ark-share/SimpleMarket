    //
//  OrderIndexCollectionViewController.swift
//  SimpleMarket
//
//  Created by macpc on 2016/08/26.
//  Copyright © 2016年 ark-share. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

private let reuseIdentifier = "OrderCell"

class OrderIndexCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var orderArray: [OrderData] = [] // 一覧用データ
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        collectionView!.delegate = self
        collectionView!.dataSource = self
        
        // ordersに要素が追加されたらクロージャ呼び出す
        FIRDatabase.database().reference().child(CommonConst.OrderPATH).observeEventType(.ChildAdded, withBlock: { snapshot in
            
            // データを設定する
            //if let uid = FIRAuth.auth()?.currentUser?.uid {
            let data = OrderData(snapshot: snapshot) //, myId: uid
            self.orderArray.insert(data, atIndex: 0)
            
            self.collectionView!.reloadData() // 再表示
            //}
            
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    // section数
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // sectionに応じたセルの数を返す
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return orderArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
        // 再利用できるセルを作る
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        let data = orderArray[indexPath.row]
        
        print("\(indexPath.row) \(data.name!)")
        
//        let imageView = cell.viewWithTag(1) as! UIImageView
//        if data.image != nil {
//            imageView.image = data.image!
//        }
//        let priceLabel = cell.viewWithTag(2) as! UILabel
//        if data.price != nil {
//            priceLabel.text = "\(data.price!) 円"
//        }
//        let nameLabel = cell.viewWithTag(3) as! UILabel
//        if data.name != nil {
//            nameLabel.text = data.name!
//        }
        
        cell.layoutIfNeeded()
    
        return cell
    }
    
    // screenサイズに合わせて整える
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellSize:CGFloat = self.view.frame.size.width / 2 - 10
        
        // 縦横同じ
        return CGSizeMake(cellSize, cellSize)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
