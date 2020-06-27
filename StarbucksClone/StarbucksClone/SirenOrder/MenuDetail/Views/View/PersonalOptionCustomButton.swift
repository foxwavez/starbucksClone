//
//  PersonalOptionCustomButton.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/16.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class PersonalOptionCustomButton: UIButton {
  
  // MARK: Views
  private let personalOptionLabel = UILabel().then {
    $0.text = "퍼스널 옵션"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 12)
  }
  private let lineLabel = UILabel().then {
    $0.text = "| "
    $0.textColor = .lightGray
  }
  private let signImageView = UIImageView().then {
    $0.image = UIImage(systemName: "chevron.right")
    $0.tintColor = .darkGray
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
    setupAttributes()
    setupConstraints()
  }
  
  private func setupAttributes() {
    self.backgroundColor = .clear
    self.layer.borderWidth = 1
    self.layer.borderColor = UIColor.lightGray.cgColor
    self.layer.cornerRadius = 2
  }
  
  private func setupConstraints() {
    let spacing: CGFloat = 10
    
    self.personalOptionLabel.then { self.addSubview($0) }
      .snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.leading.equalToSuperview().offset(spacing)
    }
    self.signImageView.then { self.addSubview($0) }
      .snp.makeConstraints {
        $0.trailing.equalToSuperview().offset(-spacing)
        $0.centerY.equalToSuperview()
    }
    self.lineLabel.then { self.addSubview($0) }
      .snp.makeConstraints {
        $0.trailing.equalTo(signImageView.snp.leading).offset(-spacing)
        $0.centerY.equalToSuperview()
    }
  }
}
