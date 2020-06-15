//
//  TopBannerTableViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/15.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class TopBannerTableViewCell: UITableViewCell {
  // MARK: Properties
  
  static let identifier = "TopBannerTVC"
  private let items = ["topBanner1", "topBanner2", "topBanner3", "topBanner4", "topBanner5", "topBanner6"]
  private var time = Timer()
  private var counter = 0
  let viewWidth = UIScreen.main.bounds.width
  
  // MARK: Views
  
  private let flowLayout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .horizontal
  }
  private lazy var topBannerCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: 155), collectionViewLayout: flowLayout).then {
    $0.showsHorizontalScrollIndicator = false
    $0.backgroundColor = .white
    $0.isPagingEnabled = true
  }
  private lazy var pageControl = UIPageControl().then {
    $0.numberOfPages = self.items.count
    $0.pageIndicatorTintColor = .black
  }
  
  // MARK: Initialize
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    DispatchQueue.main.async {
      self.time = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.changeImages), userInfo: nil, repeats: true)
    }
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
  
  private func setupConstraints() {
    self.topBannerCollectionView.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.leading.bottom.trailing.equalTo(contentView)
    }
    self.pageControl.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.bottom.centerX.equalTo(topBannerCollectionView)
    }
  }
  
  private func setupCollectionView() {
    topBannerCollectionView.delegate = self
    topBannerCollectionView.dataSource = self
    topBannerCollectionView.register(TopBannerCollectionViewCell.self, forCellWithReuseIdentifier: TopBannerCollectionViewCell.identifier)
  }
  
  // MARK: Action
  
  @objc private func changeImages() {
    if counter < items.count {
      let index = IndexPath.init(item: counter, section: 0)
      self.topBannerCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
      pageControl.currentPage = counter
      counter += 1
    } else {
      counter = 0
      let index = IndexPath.init(item: counter, section: 0)
      self.topBannerCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
      pageControl.currentPage = counter
      counter += 1
    }
  }
}

// MARK:- UICollectionViewDataSource

extension TopBannerTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopBannerCollectionViewCell.identifier, for: indexPath) as? TopBannerCollectionViewCell else { return UICollectionViewCell() }
    cell.configure(image: UIImage(named: items[indexPath.item]))
    return cell
  }
}

// MARK:- UICollectionViewDelegateFlowLayout

extension TopBannerTableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: viewWidth, height: 155)
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
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let pageSide = self.topBannerCollectionView.frame.width
    let offset = scrollView.contentOffset.x
    //    let num1 = offset - pageSide / 2
    //    let num2 = num1 / pageSide + 1
    //    let num3 = floor(num2)
    var pageNumber = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    pageControl.currentPage = pageNumber
    counter = pageNumber
  }
}

