//
//  TopBannerCollectionViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/15.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class TopBannerCollectionViewCell: UICollectionViewCell {
  static let identifier = "TopBannerCVC"
  
  // MARK: Views
  
  private let imageView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
  }
  
  // MARK: Initialize
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    setupConstraints()
  }
  
  private func setupConstraints() {
    self.imageView.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.leading.trailing.bottom.equalTo(contentView)
    }
  }
  
  // MARK: Action
  
  func configure(image: UIImage?) {
    imageView.image = image
  }
}
