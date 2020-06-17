//
//  GSThemeCollectionCell.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/05/21.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSThemeCollectionCell: UICollectionViewCell {
  // MARK: Interface
  func setItem(_ image: UIImage) {
    imageView.image = image
  }
  
  private lazy var imageView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
    $0.layer.cornerRadius = 4
  }
    
  override init(frame: CGRect) {
    super.init(frame: .zero)
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
  }
  
  private func setupConstraints() {
    imageView.snp.makeConstraints {
      $0.edges.size.equalToSuperview()
    }
  }
}
