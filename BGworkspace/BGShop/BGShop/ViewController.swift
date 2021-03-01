//
//  ViewController.swift
//  BGShop
//
//  Created by 董营利 on 2021/2/28.
//

import UIKit

class ViewController: UIViewController {
    private lazy var btn: UIButton = UIButton()
    private lazy var btntoChinese: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let color = UIColor.white
        
        self.view.backgroundColor = color
        self.btn.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        self.btn.setTitle(L10n.Localizable.click, for: UIControlState.normal)
        //self.btn.addTarget(self, action: #selector(tapped),forControlEvents:.TouchUpInside);)
        
        self.btn.addTarget(self, action: #selector(changelangage2En), for: .touchUpInside)
        
        self.view.addSubview(self.btn)
        
        
        self.btntoChinese.frame = CGRect.init(x: 100, y: 400, width: 100, height: 100)
        self.btntoChinese.setTitle(L10n.Localizable.click, for: UIControlState.normal)
        self.btntoChinese.addTarget(self, action: #selector(changelangage2Cn), for: .touchUpInside)
        self.view.addSubview(self.btntoChinese)
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeLanguage), name: NSNotification.Name(rawValue: "LanguageChanged"), object: nil)
    }

    @objc func changelangage2En() -> Void {
        LanguageHelper.shareInstance.setLanguage(langeuage: "en")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LanguageChanged"), object: nil)
        reStart()
    }
    @objc func changelangage2Cn() -> Void {
        LanguageHelper.shareInstance.setLanguage(langeuage: "zh-Hans")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LanguageChanged"), object: nil)
        reStart()
    }
    func reStart()->Void {
        /*if let _ = UserService().currentUserSeed() {
            self.navigationController = UINavigationController(rootViewController: HomeViewController(viewModel: HomeViewModel()))
        } else {
            self.navigationController = UINavigationController(rootViewController: WelcomeViewController())
        }
        
        DispatchQueue.main.async(execute: {
            UIApplication.shared.keyWindow?.rootViewController = self.navigationController
        })*/
    }
    
    @objc func tapped(){
        print("tapped")
        LocalizationTool.shareInstance.setLanguage(langeuage: "zh-Hans")
    }
    
    @objc func tapped1() {
        LocalizationTool.shareInstance.setLanguage(langeuage: "en")
    }
    
    @objc func changeLanguage(){
     
        let str:String = LanguageHelper.getString(key: L10n.Localizable.click)
        print(str)
        self.btn.setTitle(str, for: UIControlState.normal)
        }

}

