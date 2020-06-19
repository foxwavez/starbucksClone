//
//  AllMenuViewController.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/19.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class AllMenuViewController: UIViewController {
    
  // MARK: Views
  
  var tabMenuBar = TabMenuBar()
  private let flowLayout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .horizontal
  }
  private lazy var allMenuCollectionview = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).then {
    $0.backgroundColor = .white
    $0.showsHorizontalScrollIndicator = false
    $0.isPagingEnabled = true
  }
  
  // MARK: Initialize
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func setupUI() {
    setupAttributes()
    setupConstraints()
  }
  
  private func setupAttributes() {
    self.view.backgroundColor = .white
    setupNavigationBar()
  }
  
  private func setupNavigationBar() {
    title = "전체 메뉴"
    navigationController?.navigationBar.tintColor = .white
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: nil)
    
    let searchBarButton = UIButton().then {
      $0.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
      $0.imageView?.contentMode = .scaleToFill
      $0.frame = CGRect(x: 10, y: 0, width: 10, height: 10)
    }
    let orderListButton = UIButton().then {
      $0.setImage(UIImage(systemName: "bag"), for: .normal)
      $0.imageView?.contentMode = .scaleToFill
      $0.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
    }
    navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: orderListButton), UIBarButtonItem(customView: searchBarButton)]
  }
  
  private func setupConstraints() {
    let guide = view.safeAreaLayoutGuide
    let tabMenuHeight: CGFloat = 58
    
    tabMenuBar.indicatorViewWidthConstraint?.constant = self.view.frame.width / 4
    self.tabMenuBar.then { view.addSubview($0) }
      .snp.makeConstraints {
        $0.top.leading.trailing.equalTo(guide)
        $0.height.equalTo(tabMenuHeight)
    }
  }
}
