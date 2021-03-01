//
//  HomeViewcontroller.swift
//  BGShop
//
//  Created by 董营利 on 2021/2/28.
//

import UIKit

class HomeViewcontroller: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = UIColor.green
        
        let mainVC = ViewController()
        mainVC.tabBarItem.image = Asset.home.image.withRenderingMode(.alwaysOriginal)
        mainVC.tabBarItem.selectedImage = Asset.home.image.withRenderingMode(.alwaysTemplate)
        mainVC.tabBarItem.title = L10n.Localizable.home
        mainVC.tabBarItem.tag = 0
        mainVC.tabBarItem.badgeValue = "!"
        //mainVC.tabBarItem.selectedImage?.withTintColor(UIColor.blue)
        let setVC = ShopViewcontroller()
        setVC.tabBarItem.image = Asset.setting.image.withRenderingMode(.alwaysOriginal)
        setVC.tabBarItem.selectedImage = Asset.setting.image.withRenderingMode(.alwaysTemplate)
        setVC.tabBarItem.title = L10n.Localizable.me
        setVC.tabBarItem.tag = 1
        let serviceVC = ServiceViewcontroller()
        serviceVC.tabBarItem.image = Asset.service.image.withRenderingMode(.alwaysOriginal)
        serviceVC.tabBarItem.selectedImage = Asset.service.image.withRenderingMode(.alwaysTemplate)
        serviceVC.tabBarItem.title = L10n.Localizable.service
        serviceVC.tabBarItem.tag = 1
        
        self.viewControllers = [mainVC, serviceVC, setVC]
        
        self.tabBar.barTintColor = UIColor.green
    }
}
