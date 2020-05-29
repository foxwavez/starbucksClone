//
//  GSCategoryView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/05/28.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

struct GSCategoryItem: Decodable {
  var image: URL?
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
  }
  
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
    $0.dataSource = self
    $0.register(GSCategoryCollectionCell.self, forCellWithReuseIdentifier: GSCategoryCollectionCell.id)
    $0.isPagingEnabled = true
    $0.backgroundColor = .white
  }
  
  private let categoryList: [String]
  private let itemList: GSCategoryItem
  
  init(_ categoryList: [String], _ itemsByCategory: GSCategoryItem) {
    self.categoryList = categoryList
    self.itemList = itemsByCategory
    super.init(frame: .zero)
    setupUI()
  }
  
  override func layoutSubviews() {
    layout.itemSize = CGSize(width: self.bounds.width,
                             height: self.bounds.height
                              - GSViewSize.shared.segementHeight
                              - categoryScrollView.bounds.height)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    setupAttributes()
    setupConstraints()
    makeCategoryButton(categoryList)
  }
  
  private func setupAttributes() {
    [categoryScrollView, collectionView].forEach {
      $0.backgroundColor = .white
      self.addSubview($0)
    }
  }
  
  private func setupConstraints() {
    categoryScrollView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.width.equalToSuperview()
      $0.height.equalTo(56)
    }
    collectionView.snp.makeConstraints {
      $0.top.equalTo(categoryScrollView.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
      $0.width.equalToSuperview()
    }
  }
  
  private func makeCategoryButton(_ list: [String]) {
    let stackView = UIStackView().then {
      $0.axis = .horizontal
      $0.alignment = .center
      $0.distribution = .equalSpacing
      $0.spacing = 16
    }
    categoryScrollView.addSubview(stackView)
    stackView.snp.makeConstraints {
      $0.edges.height.equalToSuperview()
    }
    for str in list {
      UIButton().do {
        $0.setTitle("  \(str)  ", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        stackView.addArrangedSubview($0)
        $0.layer.cornerRadius = 16
        $0.backgroundColor = .lightGray
      }
    }
  }
}

extension GSCategoryView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categoryList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GSCategoryCollectionCell.id, for: indexPath)
    return cell
  }
}
