//
//  GSGiftBoxView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/06/09.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSGiftBoxView: UIView {
  
  private let getButton = UIButton().then {
    $0.setTitle("받은 선물", for: .normal)
    $0.backgroundColor = #colorLiteral(red: 0.5529411765, green: 0.5098039216, blue: 0.4745098039, alpha: 1)
    $0.setTitleColor(.white, for: .normal)
    $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    $0.isSelected = true
    $0.layer.borderWidth = 1
    $0.layer.borderColor = #colorLiteral(red: 0.5529411765, green: 0.5098039216, blue: 0.4745098039, alpha: 1)
    $0.layer.cornerRadius = 4
    $0.titleLabel?.font = .systemFont(ofSize: 12)
    $0.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
  }
  private let setBuuton = UIButton().then {
    $0.setTitle("보낸 선물", for: .normal)
    $0.backgroundColor = .white
    $0.setTitleColor(#colorLiteral(red: 0.5529411765, green: 0.5098039216, blue: 0.4745098039, alpha: 1), for: .normal)
    $0.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    $0.layer.borderWidth = 1
    $0.layer.borderColor = #colorLiteral(red: 0.5529411765, green: 0.5098039216, blue: 0.4745098039, alpha: 1)
    $0.layer.cornerRadius = 4
    $0.titleLabel?.font = .systemFont(ofSize: 12)
    $0.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
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
    self.backgroundColor = .white
    self.addSubview(getButton)
    self.addSubview(setBuuton)
  }
  
  private func setupConstraints() {
    getButton.snp.makeConstraints {
      $0.top.equalToSuperview().offset(12)
      $0.width.equalToSuperview().multipliedBy(0.45)
      $0.height.equalToSuperview().multipliedBy(0.06)
      $0.trailing.equalTo(self.snp.centerX)
    }
    setBuuton.snp.makeConstraints {
      $0.top.equalToSuperview().offset(12)
      $0.width.equalToSuperview().multipliedBy(0.45)
      $0.height.equalToSuperview().multipliedBy(0.06)
      $0.leading.equalTo(self.snp.centerX)
    }
  }
  @objc private func didTapButton(_ button: UIButton) {
    
  }
}
