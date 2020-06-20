//
//  SlideMenuFoodCollectionViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/19.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class SlideMenuFoodCollectionViewCell: UICollectionViewCell {
  
  // MARK: Property
  static let identifier = "SlideMenuFood"
  private let titles = ["New", "추천", "베이커리", "케이크", "샌드위치&샐러드", "따뜻한 푸드", "과일&요거트", "스낵&미니디저트", "아이스크림"]
  private let viewWidth = UIScreen.main.bounds.width
  private var previousCell = 0
  
  // MARK: Views
  private var flowLayout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .horizontal
    } {
    didSet {
      flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }
  }
  private lazy var foodCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).then {
    $0.backgroundColor = .clear
    $0.showsHorizontalScrollIndicator = false
    let indexPath = IndexPath(item: 0, section: 0)
    $0.selectItem(at: indexPath, animated: false, scrollPosition: [])
  }
  private let bottomLine = UIView().then {
    $0.backgroundColor = #colorLiteral(red: 0.7208426868, green: 0.7233764083, blue: 0.730977573, alpha: 1)
  }
  
  // MARK: Initialize
  override init(frame: CGRect) {
    super .init(frame: frame)
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
    self.foodCollectionView.dataSource = self
    self.foodCollectionView.delegate = self
    self.foodCollectionView.register(SlideMenuLabelCollectionViewCell.self, forCellWithReuseIdentifier: SlideMenuLabelCollectionViewCell.identifier)
    let indexPath = IndexPath(item: 0, section: 0)
    self.foodCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
  }
  
  private func setupConstraints() {
    self.foodCollectionView.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(45)
    }
    self.bottomLine.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.width.leading.bottom.equalToSuperview()
        $0.height.equalTo(1)
    }
  }
}

// MARK:- UICollectionViewDataSource
extension SlideMenuFoodCollectionViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return titles.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideMenuLabelCollectionViewCell.identifier, for: indexPath) as? SlideMenuLabelCollectionViewCell else { return UICollectionViewCell() }
    cell.configure(title: "\(titles[indexPath.item])")
    return cell
  }
}

// MARK:- UICollectionViewDelegateFlowLayout
extension SlideMenuFoodCollectionViewCell: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let label = UILabel(frame: CGRect.zero)
    label.text = titles[indexPath.item]
    label.sizeToFit()
    return CGSize(width: label.frame.width + 12, height: label.frame.height + 4)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 12
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let endPoint = collectionView.contentSize.width - viewWidth
    // -viewWidth를 해주는 이유는 화면시작점의 contentOffset.x를 알고 싶으니까. size는 화면 끝까지의 길이가 나옴
    
    var move: CGFloat = 0
    if indexPath.item > previousCell {
      move = 60
    } else if indexPath.item < previousCell {
      move = -60
    }
    
    var newOffset = CGPoint(x: collectionView.contentOffset.x + move, y: collectionView.contentOffset.y)
    
    if newOffset.x < 0 {
      // 맨 앞이면 더이상 움직이지 않게!
      newOffset.x = 0
    } else if newOffset.x > endPoint {
      // 맨 끝이면 더이상 움직이지 않게!
      newOffset.x = endPoint
    }
    
    collectionView.setContentOffset(newOffset, animated: true)
    previousCell = indexPath.item
  }
}
