//
//  AllMenuViewController.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/19.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

protocol AllMenuVCProtocol: class {
  func changeTabMenu(scrollTo index: Int)
}

class AllMenuViewController: UIViewController {
  
  weak var delegate: AllMenuVCProtocol?
  
  // MARK: Views
  
  var tabMenuBar = TabMenuBar()
  private let slideMenuFlowLayout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .horizontal
  }
  private lazy var slideMenuCollectionview = UICollectionView(frame: .zero, collectionViewLayout: slideMenuFlowLayout).then {
    $0.backgroundColor = .white
    $0.showsHorizontalScrollIndicator = false
    $0.isPagingEnabled = true
  }
  
  private let listMenuFlowLayout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .horizontal
  }
  private lazy var listMenuCollectionview = UICollectionView(frame: .zero, collectionViewLayout: listMenuFlowLayout).then {
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
    self.tabMenuBar.delegate = self
    self.delegate = tabMenuBar 
    setupNavigationBar()
    setupCollectionView()
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
  
  private func setupCollectionView() {
    self.slideMenuCollectionview.contentInsetAdjustmentBehavior = .never
    self.slideMenuCollectionview.dataSource = self
    self.slideMenuCollectionview.delegate = self
    self.slideMenuCollectionview.register(SlideMenuBeverageCollectionViewCell.self, forCellWithReuseIdentifier: SlideMenuBeverageCollectionViewCell.identifier)
    self.slideMenuCollectionview.register(SlideMenuFoodCollectionViewCell.self, forCellWithReuseIdentifier: SlideMenuFoodCollectionViewCell.identifier)
    self.slideMenuCollectionview.register(SlideMenuGoodsCollectionViewCell.self, forCellWithReuseIdentifier: SlideMenuGoodsCollectionViewCell.identifier)
    
    self.listMenuCollectionview.contentInsetAdjustmentBehavior = .never
    self.listMenuCollectionview.dataSource = self
    self.listMenuCollectionview.delegate = self
    self.listMenuCollectionview.register(ListMenuCollectionViewCell.self, forCellWithReuseIdentifier: ListMenuCollectionViewCell.identifier)
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
    self.slideMenuCollectionview.then { view.addSubview($0) }
      .snp.makeConstraints {
        $0.leading.trailing.equalTo(guide)
        $0.top.equalTo(tabMenuBar.snp.bottom)
        $0.height.equalTo(60)
    }
    self.listMenuCollectionview.then { view.addSubview($0) }
      .snp.makeConstraints {
        $0.leading.trailing.bottom.equalTo(guide)
        $0.top.equalTo(self.slideMenuCollectionview.snp.bottom)
    }
  }
}

// MARK:- UICollectionviewDataSource
extension AllMenuViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    switch collectionView {
    case listMenuCollectionview:
      return 4
    default:
      return 1
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == listMenuCollectionview {
      switch section {
      case 0:
        return 14
      case 1:
        return 9
      case 2:
        return 13
      default:
        return 1
      }
    } else {
      return 3
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == slideMenuCollectionview {
      switch indexPath.item {
      case 0:
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideMenuBeverageCollectionViewCell.identifier, for: indexPath) as? SlideMenuBeverageCollectionViewCell else { return UICollectionViewCell() }
        return cell
      case 1:
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideMenuFoodCollectionViewCell.identifier, for: indexPath) as? SlideMenuFoodCollectionViewCell else { return UICollectionViewCell() }
        return cell
      case 2:
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideMenuGoodsCollectionViewCell.identifier, for: indexPath) as? SlideMenuGoodsCollectionViewCell else { return UICollectionViewCell() }
        return cell
      default:
        return UICollectionViewCell()
      }
    } else {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListMenuCollectionViewCell.identifier, for: indexPath) as? ListMenuCollectionViewCell else { return UICollectionViewCell() }
      return cell
    }
  }
}

// MARK:- UICollectionViewDelegateFlowLayout
extension AllMenuViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView == slideMenuCollectionview {
      return CGSize(width: view.frame.width, height: 60)
    } else {
      //et heightSize = view.frame.height - tabMenuBar.frame.height - slideMenuCollectionview.frame.height
      //return CGSize(width: view.frame.width, height: heightSize)
      return CGSize(width: view.frame.width, height: self.listMenuCollectionview.frame.height)
    }
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    if scrollView == slideMenuCollectionview {
      let itemAt = Int(targetContentOffset.pointee.x / view.frame.width)
      delegate?.changeTabMenu(scrollTo: itemAt)
    }
    
  }
}

// MARK:- TabMenuBarProtocol
extension AllMenuViewController: TabMenuBarProtocol {
  func changeSlideMenu(scrollTo index: Int) {
    if index != 3 {
      let indexPath = IndexPath(row: index, section: 0)
      self.slideMenuCollectionview.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
  }
}
