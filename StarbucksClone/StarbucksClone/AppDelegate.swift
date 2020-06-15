//
//  AppDelegate.swift
//  StarbucksClone
//
//  Created by JinGyung Kim on 2020/05/07.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit
import Then
import Alamofire
import Kingfisher
import SnapKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    //let mainVC = UINavigationController(rootViewController: SirenOrderMainViewController()
    let mainVC = UINavigationController(rootViewController: MenuDetailViewController()
      
      
      //    let mainVC = UINavigationController(rootViewController:
      //      GiftShopViewController()
      //    GSDetailViewController(seletedItem: GiftDetailItem(image: UIImage(named: "test")!, title: "테스트", subtitle: "이것은 테스트", price: 10000),
      //                           otherItems: [
      //                             [UIImage(named: "test")!: "무엇이냐1"],
      //                             [UIImage(named: "test")!: "무엇이냐2"],
      //                             [UIImage(named: "test")!: "무엇이냐3"],
      //                             [UIImage(named: "test")!: "무엇이냐4"],
      //                             [UIImage(named: "test")!: "무엇이냐5"],
      //                             [UIImage(named: "test")!: "무엇이냐6"],
      //                             [UIImage(named: "test")!: "무엇이냐7"],
      //                             [UIImage(named: "test")!: "무엇이냐8"],
      //                             [UIImage(named: "test")!: "무엇이냐9"]
      //                           ])
    )
    
    mainVC.navigationBar.barStyle = .black
    mainVC.navigationBar.backgroundColor = .black
    mainVC.navigationBar.tintColor = .white
    mainVC.navigationBar.isTranslucent = false
    mainVC.navigationBar.titleTextAttributes = [
      .foregroundColor: UIColor.white,
      
    ]
    
    window?.rootViewController = mainVC
    window?.makeKeyAndVisible()
    
    return true
  }
  
}
