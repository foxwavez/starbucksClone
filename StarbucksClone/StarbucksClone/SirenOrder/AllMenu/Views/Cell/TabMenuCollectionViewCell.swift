//
//  TabMenuCollectionViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/17.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class TabMenuCollectionViewCell: UICollectionViewCell {
  
  // MARK: Property
  
  static let identifier = "TabMenuBarCell"
  
  var tabMenuLabel = UILabel().then {
    $0.textAlignment = .center
    $0.font = UIFont.systemFont(ofSize: 15, weight: .medium)
    $0.textColor = #colorLiteral(red: 0.4032030404, green: 0.3995964527, blue: 0.399479419, alpha: 1)
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
      self.tabMenuLabel.textColor = isSelected ? #colorLiteral(red: 0.6079670787, green: 0.5307973623, blue: 0.3349733949, alpha: 1) : .darkGray
    }
  }
  
  private func setupConstraints() {
    self.tabMenuLabel.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.centerX.centerY.equalToSuperview()
    }
  }
  
  // MARK: Interface
  
  func configure(title: String) {
    self.tabMenuLabel.text = title
  }
}
