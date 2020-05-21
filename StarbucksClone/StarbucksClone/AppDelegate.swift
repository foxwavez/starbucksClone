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
    let VC = UINavigationController(rootViewController: ViewController())
    
    VC.navigationBar.barStyle = .black
    VC.navigationBar.backgroundColor = .black
    VC.navigationBar.tintColor = .white
    VC.navigationBar.isTranslucent = false
    VC.navigationBar.titleTextAttributes = [
        .foregroundColor: UIColor.white,
        
    ]
    
    window?.rootViewController = VC
    window?.makeKeyAndVisible()
    
    return true
  }
  
}
