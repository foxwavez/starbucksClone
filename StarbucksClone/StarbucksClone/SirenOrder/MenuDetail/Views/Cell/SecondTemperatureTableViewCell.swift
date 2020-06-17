//
//  SecondTemperatureTableViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/16.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class SecondTemperatureTableViewCell: UITableViewCell {
  // MARK: Property
  static let identifier = "ChooseTemperature"
  var isHot = true
  
  // MARK: Views
  let hotButton = UIButton().then {
   $0.setTitle("HOT", for: .normal)
   $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
   $0.layer.borderColor = #colorLiteral(red: 0.6181058288, green: 0.1355170906, blue: 0.2100901306, alpha: 1)
   $0.layer.borderWidth = 1
   $0.layer.cornerRadius = 2
  }
  let icedButton = UIButton().then {
    $0.setTitle("ICED", for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    $0.layer.borderColor = #colorLiteral(red: 0.3082438707, green: 0.5942969322, blue: 0.8466129899, alpha: 1)
    $0.layer.borderWidth = 1
    $0.layer.cornerRadius = 2
  }
  
  // MARK: Initialize
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    checkIsHot()
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
    hotButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    icedButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
  }
  
  private func setupConstraints() {
    let spacing: CGFloat = 10
    
    self.hotButton.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.leading.bottom.equalTo(contentView).inset(spacing)
        $0.trailing.equalTo(self.contentView.snp.centerX).offset(-spacing / 2)
    }
    self.icedButton.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.trailing.bottom.equalTo(contentView).inset(spacing)
        $0.leading.equalTo(self.contentView.snp.centerX).offset(spacing / 2)
    }
  }
  
  // MARK: Action
  func checkIsHot() {
    if isHot {
      hotButton.setTitleColor(.white, for: .normal)
      hotButton.backgroundColor = #colorLiteral(red: 0.6181058288, green: 0.1355170906, blue: 0.2100901306, alpha: 1)
      icedButton.setTitleColor(#colorLiteral(red: 0.3082438707, green: 0.5942969322, blue: 0.8466129899, alpha: 1), for: .normal)
      icedButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    } else {
      hotButton.setTitleColor(#colorLiteral(red: 0.6181058288, green: 0.1355170906, blue: 0.2100901306, alpha: 1), for: .normal)
      hotButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
      icedButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
      icedButton.backgroundColor = #colorLiteral(red: 0.3082438707, green: 0.5942969322, blue: 0.8466129899, alpha: 1)
    }
    isHot.toggle()
  }
  
  @objc func didTapButton(_ sender: Any) {
   checkIsHot()
  }
}
