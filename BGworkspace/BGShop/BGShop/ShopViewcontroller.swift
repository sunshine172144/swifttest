//
//  ShopViewcontroller.swift
//  BGShop
//
//  Created by 董营利 on 2021/2/28.
//

import UIKit

class ShopViewcontroller: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    var collectionView:UICollectionView!
    //课程名称和图片，每一门课程用字典来表示
    let courses = [
        ["name":"Swift","pic":"swift.png"],
        ["name":"Xcode","pic":"xcode.png"],
        ["name":"Java","pic":"java.png"],
        ["name":"PHP","pic":"php.png"],
        ["name":"JS","pic":"js.png"],
        ["name":"React","pic":"react.png"],
        ["name":"Ruby","pic":"ruby.png"],
        ["name":"HTML","pic":"html.png"],
        ["name":"C#","pic":"c#.png"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = CustomLayout()
        //let layout = UICollectionViewFlowLayout()
        let frame = CGRect(x:0, y:20, width: view.bounds.size.width,
                           height:view.bounds.height-20)
        self.collectionView = UICollectionView(frame: frame, collectionViewLayout:layout)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        // 注册CollectionViewCell
        self.collectionView.register(UICollectionViewCell.self,
                                     forCellWithReuseIdentifier: "ViewCell")
        //默认背景是黑色和label一致
        self.collectionView.backgroundColor = UIColor.white
        
        //设置collectionView的内边距
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        
        self.view.addSubview(collectionView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // CollectionView行数
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return courses.count;
    }
    
    // 获取单元格
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // storyboard里设计的单元格
        let identify:String = "ViewCell"
        // 获取设计的单元格，不需要再动态添加界面元素
        let cell = self.collectionView.dequeueReusableCell(
            withReuseIdentifier: identify, for: indexPath) as UICollectionViewCell
        //先清空内部原有的元素
        for subview in cell.subviews {
            subview.removeFromSuperview()
        }
        // 添加图片
        let img = UIImageView(image: UIImage(named: courses[indexPath.item]["pic"]!))
        img.frame = cell.bounds
        img.contentMode = .scaleAspectFit
        // 图片上面显示课程名称，居中显示
        let lbl = UILabel(frame:CGRect(x:0, y:0, width:cell.bounds.size.width, height:20))
        lbl.textColor = UIColor.white
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        lbl.text = courses[indexPath.item]["name"]
        cell.addSubview(img)
        cell.addSubview(lbl)
        return cell
    }
    
    /* 自定义布局不需要调用
     //单元格大小
     func collectionView(collectionView: UICollectionView!,
     layout collectionViewLayout: UICollectionViewLayout!,
     sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
     let size:Float = indexPath.item % 3 == 0 ? 200 : 100
     return CGSize(width:size, height:size)
     }
     */
}
