//
//  SlideMenuLabelCollectionViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/19.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class SlideMenuLabelCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "SlideMenuLabel"
  
  // MARK: Views
  
  private var titleLabel = UILabel().then {
    $0.textColor = #colorLiteral(red: 0.4032030404, green: 0.3995964527, blue: 0.399479419, alpha: 1)
    $0.font = UIFont.systemFont(ofSize: 15)
    $0.textAlignment = .center
    $0.backgroundColor = .clear
    $0.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    $0.layer.cornerRadius = 13
    $0.clipsToBounds = true
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
    setupConstraints()
  }
  
  override var isSelected: Bool {
    didSet {
      self.titleLabel.textColor = isSelected ? .white : #colorLiteral(red: 0.4032030404, green: 0.3995964527, blue: 0.399479419, alpha: 1)
      self.titleLabel.backgroundColor = isSelected ? #colorLiteral(red: 0.4032030404, green: 0.3995964527, blue: 0.399479419, alpha: 1) : .white
    }
  }
  
  private func setupConstraints() {
    self.titleLabel.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.centerX.centerY.equalToSuperview()
        $0.width.height.equalToSuperview()
    }
  }
  
  func configure(title: String) {
    self.titleLabel.text = title
  }
}
