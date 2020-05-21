//
//  GiftShopViewController.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/05/13.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GiftShopViewController: UIViewController {
  
  // BestNewCollectionView.height = 252
  // ThemeCollectionView.height = 408
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func setupUI() {
    setupAttributes()
    setupConstraints()
  }
  
  private func setupAttributes() {
    view.backgroundColor = .white
  }
  
  private func setupConstraints() {
  }
}
