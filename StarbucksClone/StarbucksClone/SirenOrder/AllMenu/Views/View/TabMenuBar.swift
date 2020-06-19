//
//  TabMenuBar.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/17.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class TabMenuBar: UIView {
  // MARK: Property
  
  private let viewWidth = UIScreen.main.bounds.width
  private let titles = ["음료", "푸드", "상품", "홀케이크 예약"]
  var indicatorViewLeadingConstraint: NSLayoutConstraint?
  var indicatorViewWidthConstraint: NSLayoutConstraint?
  private let cakeReservesize: CGFloat = UIScreen.main.bounds.width / 4 + 30
  private let restSize: CGFloat = (UIScreen.main.bounds.width - (UIScreen.main.bounds.width / 4 + 30)) / 3
  //  private let cakeReservesize: CGFloat = collectionView.frame.size.width / 4 + 30
  //  private let restSize: CGFloat = (collectionView.frame.size.width - cakeReservesize) / 3
  
  // MARK: Views
  
  private let flowLayout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .horizontal
  }
  private lazy var tabMenuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).then {
    $0.showsHorizontalScrollIndicator = false
    $0.backgroundColor = .white
    $0.isScrollEnabled = false
  }
  private var indicatorView = UIView().then {
    $0.backgroundColor = #colorLiteral(red: 0.6079670787, green: 0.5307973623, blue: 0.3349733949, alpha: 1)
  }
  private let bottomLine = UIView().then {
    $0.backgroundColor = #colorLiteral(red: 0.7208426868, green: 0.7233764083, blue: 0.730977573, alpha: 1)
  }
  
  // MARK: Initialize
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    setupAttributes()
    setupConstraints()
  }
  
  private func setupAttributes() {
    setupCollectionView()
    
  }
  
  private func setupCollectionView() {
    self.tabMenuCollectionView.dataSource = self
    self.tabMenuCollectionView.delegate = self
    self.tabMenuCollectionView.register(TabMenuCollectionViewCell.self, forCellWithReuseIdentifier: TabMenuCollectionViewCell.identifier)
    let indexPath = IndexPath(item: 0, section: 0)
    self.tabMenuCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
  }
  
  private func setupConstraints() {
    let indicatorHeight: CGFloat = 3
    
    self.tabMenuCollectionView.then { self.addSubview($0) }
      .snp.makeConstraints {
        $0.top.leading.trailing.equalTo(self)
    }
    self.indicatorView.then { self.addSubview($0) }
      .snp.makeConstraints {
        $0.height.equalTo(indicatorHeight)
        $0.top.equalTo(self.tabMenuCollectionView.snp.bottom)
    }
    self.bottomLine.then { self.addSubview($0) }
      .snp.makeConstraints {
        $0.width.leading.bottom.equalToSuperview()
        $0.height.equalTo(0.5)
        $0.top.equalTo(indicatorView.snp.bottom)
    }
    
    self.indicatorView.translatesAutoresizingMaskIntoConstraints = false
    self.indicatorViewLeadingConstraint = self.indicatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
    self.indicatorViewLeadingConstraint?.isActive = true
    self.indicatorViewWidthConstraint = self.indicatorView.widthAnchor.constraint(equalToConstant: restSize)
    self.indicatorViewWidthConstraint?.isActive = true
  }
}

// MARK:- UICollectionViewDelegate
extension TabMenuBar: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabMenuCollectionViewCell.identifier, for: indexPath) as? TabMenuCollectionViewCell else { return UICollectionViewCell() }
    cell.configure(title: titles[indexPath.item])
    return cell
  }
}

// MARK:- UICollectionViewDelegateFlowLayout
extension TabMenuBar: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    switch indexPath.item {
    case 3:
      return CGSize(width: cakeReservesize, height: collectionView.frame.size.height)
    default:
      return CGSize(width: restSize, height: collectionView.frame.size.height)
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
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let cell = collectionView.cellForItem(at: indexPath) as? TabMenuCollectionViewCell else { return }
    cell.tabMenuLabel.textColor = #colorLiteral(red: 0.6079670787, green: 0.5307973623, blue: 0.3349733949, alpha: 1)
    
    switch indexPath.item {
    case 3:
      self.indicatorViewLeadingConstraint?.constant = CGFloat(Int(restSize) * indexPath.item) + 5
      self.indicatorViewWidthConstraint?.constant = cakeReservesize
    default:
      self.indicatorViewLeadingConstraint?.constant = CGFloat(Int(restSize) * indexPath.item)
      self.indicatorViewWidthConstraint?.constant = restSize
    }
    UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
      self.layoutIfNeeded()
    }, completion: nil)
  }
  
  func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    guard let cell = collectionView.cellForItem(at: indexPath) as? TabMenuCollectionViewCell else { return }
    cell.tabMenuLabel.textColor = #colorLiteral(red: 0.4032030404, green: 0.3995964527, blue: 0.399479419, alpha: 1)
  }
}
