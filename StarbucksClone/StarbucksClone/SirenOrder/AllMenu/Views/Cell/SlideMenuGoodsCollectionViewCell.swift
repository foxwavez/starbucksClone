//
//  SlideMenuGoodsCollectionViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/19.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class SlideMenuGoodsCollectionViewCell: UICollectionViewCell {
  // MARK: Property
  static let identifier = "SlideMenuGoods"
  private let titles = ["New", "추천", "머그/글라스", "스테인리스텀블러", "플라스틱텀블러", "보온병", "액세서리", "커피용품", "원두", "오리가미", "비아", "패키지 티", "리저브 원두"]
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
  private lazy var goodsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).then {
    $0.backgroundColor = .clear
    $0.showsHorizontalScrollIndicator = false
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
    self.goodsCollectionView.dataSource = self
    self.goodsCollectionView.delegate = self
    self.goodsCollectionView.register(SlideMenuLabelCollectionViewCell.self, forCellWithReuseIdentifier: SlideMenuLabelCollectionViewCell.identifier)
    let indexPath = IndexPath(item: 0, section: 0)
    self.goodsCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
  }
  
  private func setupConstraints() {
    self.goodsCollectionView.then { self.contentView.addSubview($0) }
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
extension SlideMenuGoodsCollectionViewCell: UICollectionViewDataSource {
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
extension SlideMenuGoodsCollectionViewCell: UICollectionViewDelegateFlowLayout {
  
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

