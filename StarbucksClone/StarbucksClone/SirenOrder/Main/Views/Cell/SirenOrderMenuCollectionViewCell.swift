//
//  SirenOrderMenuCollectionViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/16.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class SirenOrderMenuCollectionViewCell: UICollectionViewCell {
  // MARK: Property
    
    static let identifier = "SirenOrderCVC"
    
    // MARK: Views
    
    private let imageView = UIImageView().then {
      $0.layer.cornerRadius = 45
      $0.clipsToBounds = true
      $0.contentMode = .scaleAspectFit
    }
    private let titleLabel = UILabel().then {
      $0.font = UIFont.systemFont(ofSize: 12, weight: .light)
      $0.textColor = .black
      $0.textAlignment = .center
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
      imageView.image = UIImage(named: "coffee")
      titleLabel.text = "아메리카노"
      setupConstraints()
    }
    
    private func setupConstraints() {
      let imageSize: CGFloat = 90
      self.imageView.then { self.contentView.addSubview($0) }
        .snp.makeConstraints {
          $0.top.leading.equalToSuperview()
          $0.width.height.equalTo(imageSize)
      }
      self.titleLabel.then { self.contentView.addSubview($0) }
        .snp.makeConstraints {
          $0.leading.width.equalTo(imageView)
          $0.top.equalTo(imageView.snp.bottom).offset(8)
      }
    }
    
    // MARK: Action
    
  //  func configure(image: UIImage?, title: String) {
  //    self.imageView.image = image
  //    self.titleLabel.text = title
  //  }
    
}
