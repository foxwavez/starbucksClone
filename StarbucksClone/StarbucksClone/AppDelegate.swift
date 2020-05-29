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
    let mainVC = UINavigationController(rootViewController: GiftShopViewController())
    
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
