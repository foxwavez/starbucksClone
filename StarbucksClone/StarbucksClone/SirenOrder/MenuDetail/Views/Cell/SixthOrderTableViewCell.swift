//
//  SixthOrderTableViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/16.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class SixthOrderTableViewCell: UITableViewCell {
  
  // MARK: Property
  static let identifier = "OrderButton"
  
  // MARK: Views
  private let presentButton = UIButton().then {
    $0.setTitle("선물하기", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.backgroundColor = #colorLiteral(red: 0.4782953858, green: 0.432043016, blue: 0.3970021009, alpha: 1)
    $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14.5)
    $0.layer.cornerRadius = 2
  }
  private let orderButton = UIButton().then {
    $0.setTitle("바로 주문하기", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.backgroundColor = #colorLiteral(red: 0.4782953858, green: 0.432043016, blue: 0.3970021009, alpha: 1)
    $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14.5)
    $0.layer.cornerRadius = 2
  }
  
  // MARK: Initialize
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
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
    //targetAction
  }
  
  private func setupConstraints() {
    let spacing: CGFloat = 10
    let cellWidth = (UIScreen.main.bounds.width) - (spacing * 2)
    
    self.presentButton.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.leading.equalToSuperview().offset(spacing)
        $0.width.equalTo((cellWidth - (spacing / 2)) / 2)
        $0.bottom.equalToSuperview()
    }
    self.orderButton.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.trailing.equalToSuperview().inset(spacing)
        $0.width.equalTo(presentButton)
        $0.bottom.equalToSuperview()
    }
  }
}
