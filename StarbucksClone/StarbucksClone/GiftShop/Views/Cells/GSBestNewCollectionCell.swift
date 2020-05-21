//
//  GSBestNewCollectionCell.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/05/19.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSBestNewCollectionCell: UICollectionViewCell {
  
  // MARK: Interface
  func setItem(_ item: [UIImage: String]) {
    for (key, value) in item {
      imageView.image = key
      nameLabel.text =  value
    }
  }
  
  static let id = "GSBestNewCollectionCell"
  
  private let imageView = UIImageView().then {
    $0.layer.cornerRadius = 4
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
  }
  
  private let nameLabel = UILabel().then {
    $0.numberOfLines = 0
    $0.textAlignment = .center
    $0.font = .systemFont(ofSize: 13)
    $0.textColor = #colorLiteral(red: 0.3137254902, green: 0.3137254902, blue: 0.3137254902, alpha: 1)
  }
  
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
    contentView.backgroundColor = .white
    contentView.addSubview(imageView)
    contentView.addSubview(nameLabel)
  }
  
  private func setupConstraints() {
    imageView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.size.equalTo(120)
    }
    nameLabel.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom).offset(12)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
  
}
