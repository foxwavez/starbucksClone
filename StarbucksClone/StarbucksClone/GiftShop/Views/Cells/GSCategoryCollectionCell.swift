//
//  GSCategoryCollectionCell.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/05/28.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSCategoryCollectionCell: UICollectionViewCell {
  static let id = "GSCategoryCollectionCell"
  
  private lazy var layout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .vertical
    $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    $0.minimumLineSpacing = 0
    $0.minimumInteritemSpacing = 0
  }

  private lazy var itemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
    $0.dataSource = self
    $0.register(GSItemByCategoyrCollectionCell.self, forCellWithReuseIdentifier: GSItemByCategoyrCollectionCell.id)
    $0.backgroundColor = .white
  }

  override init(frame: CGRect) {
    super.init(frame: .zero)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    layout.itemSize = CGSize(width: self.bounds.width/2, height: 236)
  }
  
  private func setupUI() {
    setupAttributes()
    setupConstraints()
  }
  
  private func setupAttributes() {
    contentView.backgroundColor = .white
    contentView.addSubview(itemCollectionView)
  }
  
  private func setupConstraints() {
    itemCollectionView.snp.makeConstraints {
      $0.edges.equalTo(contentView.snp.edges)
    }
  }
}

extension GSCategoryCollectionCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GSItemByCategoyrCollectionCell.id, for: indexPath) as? GSItemByCategoyrCollectionCell else { return UICollectionViewCell() }
    cell.configure(image: UIImage(named: "test")!, title: "테스터 나부랭이 두 줄 되나 어디 보자 ", price: "10,000원")
    return cell
  }
}
