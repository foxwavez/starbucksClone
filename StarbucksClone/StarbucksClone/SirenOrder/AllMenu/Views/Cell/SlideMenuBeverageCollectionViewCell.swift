//
//  SlideMenuBeverageCollectionViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/19.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

protocol SlideMenuBeverageProtocol: class {
  func changeBeverageListMenu(scrollTo index: Int)
}

class SlideMenuBeverageCollectionViewCell: UICollectionViewCell {
  
  // MARK: Property
  weak var delegate: SlideMenuBeverageProtocol?
  static let identifier = "SlideMenuBeverate"
  private let titles = ["NEW", "추천", "콜드 브루", "리저브", "에스프레소", "디카페인 커피", "블론드", "프라푸치노", "블렌디드", "피지오", "티(티바나)", "브루드 커피", "기타", "병음료"]
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
  private lazy var beverageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).then {
    $0.backgroundColor = .clear
    $0.showsHorizontalScrollIndicator = false
//    let indexPath = IndexPath(item: 0, section: 0)
//    $0.selectItem(at: indexPath, animated: false, scrollPosition: [])
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
    self.beverageCollectionView.dataSource = self
    self.beverageCollectionView.delegate = self
    self.beverageCollectionView.register(SlideMenuLabelCollectionViewCell.self, forCellWithReuseIdentifier: SlideMenuLabelCollectionViewCell.identifier)
    let indexPath = IndexPath(item: 0, section: 0)
    self.beverageCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
  }
  
  private func setupConstraints() {
    self.beverageCollectionView.then { self.contentView.addSubview($0) }
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
extension SlideMenuBeverageCollectionViewCell: UICollectionViewDataSource {
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
extension SlideMenuBeverageCollectionViewCell: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let label = UILabel(frame: CGRect.zero)
    label.text = titles[indexPath.item]
    label.sizeToFit()
    return CGSize(width: label.frame.width + 12, height: label.frame.height + 6)
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
    delegate?.changeBeverageListMenu(scrollTo: indexPath.item)
    // 아래코드 엄청 중복됨 수정하기!
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

// MARK:- AllMenuVCProtocol
extension SlideMenuBeverageCollectionViewCell: AllMenuVCProtocol {
  func changeMenu(scrollTo index: Int) {
    let indexPath = IndexPath(row: index, section: 0)
    self.beverageCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
    
    let endPoint = beverageCollectionView.contentSize.width - viewWidth
    // -viewWidth를 해주는 이유는 화면시작점의 contentOffset.x를 알고 싶으니까. size는 화면 끝까지의 길이가 나옴
    
    var move: CGFloat = 0
    if indexPath.item > previousCell {
      move = 60
    } else if indexPath.item < previousCell {
      move = -60
    }
    
    var newOffset = CGPoint(x: beverageCollectionView.contentOffset.x + move, y: beverageCollectionView.contentOffset.y)
    
    if newOffset.x < 0 {
      // 맨 앞이면 더이상 움직이지 않게!
      newOffset.x = 0
    } else if newOffset.x > endPoint {
      // 맨 끝이면 더이상 움직이지 않게!
      newOffset.x = endPoint
    }
    
    beverageCollectionView.setContentOffset(newOffset, animated: true)
    previousCell = indexPath.item
  }
  
  
}
