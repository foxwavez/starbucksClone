//
//  GSCategoryView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/05/28.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

struct GSCategoryItem: Decodable {
  var image: URL
  var title: String
  var price: String
}

class GSCategoryView: UIView {
 
  // 상단 스크롤 뷰
  // 컬렉션 뷰 안에 컬렉션 뷰
  
  // 카테고리 리스트
  // 리스트에 따른 리스트
  
  private lazy var categoryScrollView = UIScrollView()
  
  private lazy var layout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .horizontal
    $0.minimumInteritemSpacing = 0
    $0.minimumLineSpacing = 0
    $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    $0.itemSize = CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
  }
  
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
    $0.dataSource = self
    $0.register(GSCategoryCollectionCell.self, forCellWithReuseIdentifier: "cell")
  }
  
  private let categoryList: [String]
  private let itemList: GSCategoryItem
  
  init(_ categoryList: [String], _ itemsByCategory: GSCategoryItem) {
    self.categoryList = categoryList
    self.itemList = itemsByCategory
    super.init(frame: .zero)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    setupAttributes()
    setupConstraints()
    collectionView.collectionViewLayout = layout
  }
  
  private func setupAttributes() {
    [categoryScrollView, collectionView].forEach { self.addSubview($0) }
  }
  
  private func setupConstraints() {
    
  }
}

extension GSCategoryView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categoryList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    <#code#>
  }
  
  
}
