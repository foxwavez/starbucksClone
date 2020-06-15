//
//  SirenOrderMenuStoryCollectionViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/16.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class SirenOrderMenuStoryCollectionViewCell: UICollectionViewCell {
  // MARK: Property
  static let identifier = "SirenOrderMenuStoryCVC"
  
  // MARK: Views
  private let menuStoryButton = UIButton().then {
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
  }
  
  // MARK: Initialize
  override init(frame: CGRect) {
    super .init(frame: frame)
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupConstraints() {
    self.menuStoryButton.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  // MARK: Interface
  func configure(image: UIImage?) {
    menuStoryButton.setImage(image, for: .normal)
  }
}
