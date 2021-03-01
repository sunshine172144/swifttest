//
//  LocalizationTool.swift
//  BGShop
//
//  Created by 董营利 on 2021/2/28.
//

import UIKit
 
class LocalizationTool: NSObject {
     static let shareInstance = LocalizationTool()
 
     let def = UserDefaults.standard
     var bundle : Bundle?
     
     func valueWithKey(key: String!) -> String {
          let bundle = LocalizationTool.shareInstance.bundle
          let str = bundle?.localizedString(forKey: key, value: nil, table: "Language")
          return str!
     }
//    class func valueWithKey(key: String!) -> String {
//
//        let languageString = SynthesizerSettingTool.shareIntance.vocieParams?.languageType
//        let path = Bundle.main.path(forResource: languageString!, ofType: "lproj")
//        let value = (Bundle.init(path: path!)?.localizedString(forKey: key, value: nil, table: "Language"))!
//        return value
//    }
     
     func setLanguage(langeuage:String) {
          var str=langeuage
          if langeuage=="" || langeuage == nil{
               
               let languages:[String]=UserDefaults.standard.object(forKey: "AppleLanguages") as! [String]
               let str2:String=languages[0]
               if ((str2=="zh-Hans-CN")||(str2=="zh-Hans")){
                    str="zh-Hans"
               }else{
                    str="en"
               }
               
          }
          UserDefaults.standard.set(str, forKey: "langeuage")
          UserDefaults.standard.synchronize()
          let path = Bundle.main.path(forResource:str , ofType: "lproj")
          bundle = Bundle(path: path!)
//          def.set(langeuage, forKey: UserLanguage)
//          def.synchronize()
          NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LanguageChanged"), object: nil)
 
          
     }
}
