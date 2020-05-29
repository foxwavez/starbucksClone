//
//  GSItemByCategoyrCollectionCell.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/05/29.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSItemByCategoyrCollectionCell: UICollectionViewCell {
  static let id = "GSItemByCategoyrCollectionCell"
  
  // MARK: Interface
  func configure(image: UIImage, title: String, price: String) {
    imageView.image = image
    titleLabel.text = title
    priceLabel.text = price
  }
  
  private let imageView = UIImageView().then {
    $0.contentMode = .scaleAspectFit
  }
  
  private let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 13)
    $0.textColor = #colorLiteral(red: 0.3843137255, green: 0.3843137255, blue: 0.3843137255, alpha: 1)
    $0.textAlignment = .center
    $0.numberOfLines = 0
  }
  
  private let priceLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.textAlignment = .center
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
    [imageView, titleLabel, priceLabel].forEach { contentView.addSubview($0) }
    [imageView, titleLabel, priceLabel].forEach {
      $0.layer.borderWidth = 1
    }
  }
  
  private func setupConstraints() {
    [imageView, titleLabel, priceLabel].forEach {
      $0.snp.makeConstraints {
        $0.leading.trailing.equalToSuperview()
      }
    }
    imageView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.64)
    }
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom)
    }
    priceLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom)
      $0.bottom.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.16)
    }
  }
  
}
