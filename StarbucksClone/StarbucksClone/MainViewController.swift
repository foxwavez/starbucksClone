//
//  ViewController.swift
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

class MainViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupNavigation()
  }
  
  private func setupUI() {
    view.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.1137254902, blue: 0.1137254902, alpha: 1)
  }
  
  private func setupNavigation() {
    self.navigationItem.titleView = UIImageView(image: UIImage(named: "logo_starbucks"))
    self.navigationItem.titleView?.contentMode = .scaleAspectFit
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(systemName: "line.horizontal.3"), style: .done, target: self, action: #selector(didTapNavigtionButton))
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.init(systemName: "bell"), style: .done, target: self, action: #selector(didTapNavigtionButton))
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: nil)
  }
  @objc private func didTapNavigtionButton() {
    
  }
}


